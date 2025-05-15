# Copyright (c) Microsoft Corporation. 
# Licensed under the MIT license.

# -*- coding:utf-8 -*-
import argparse
import bleu
import weighted_ngram_match
import syntax_match
import dataflow_match

alpha,beta,gamma,theta = [0.25,0.25,0.25,0.25]

# preprocess inputs
#pre_references = [[x.strip() for x in open("2mm.c", 'r', encoding='utf-8').readlines()]]
hypothesis = [x.strip() for x in open("benchmark.cbe.c", 'r', encoding='utf-8').readlines()]

with open('2mm.c', 'r') as file:
    pre_references = [[file.read().replace('\n', '')]]

with open('benchmark.cbe.c', 'r') as file:
    hypothesis = [file.read().replace('\n', '')]


for i in range(len(pre_references)):
    assert len(hypothesis) == len(pre_references[i])

references = []
for i in range(len(hypothesis)):
    ref_for_instance = []
    for j in range(len(pre_references)):
        ref_for_instance.append(pre_references[j][i])
    references.append(ref_for_instance)
assert len(references) == len(pre_references)*len(hypothesis)


# calculate ngram match (BLEU)
tokenized_hyps = [x.split() for x in hypothesis]
tokenized_refs = [[x.split() for x in reference] for reference in references]

ngram_match_score = bleu.corpus_bleu(tokenized_refs,tokenized_hyps)

# calculate weighted ngram match
keywords = [x.strip() for x in open('keywords/'+'c'+'.txt', 'r', encoding='utf-8').readlines()]
def make_weights(reference_tokens, key_word_list):
    return {token:1 if token in key_word_list else 0.2 \
            for token in reference_tokens}
tokenized_refs_with_weights = [[[reference_tokens, make_weights(reference_tokens, keywords)]\
            for reference_tokens in reference] for reference in tokenized_refs]

weighted_ngram_match_score = weighted_ngram_match.corpus_bleu(tokenized_refs_with_weights,tokenized_hyps)

# calculate syntax match
syntax_match_score = syntax_match.corpus_syntax_match(references, hypothesis, 'c')

# calculate dataflow match
dataflow_match_score = dataflow_match.corpus_dataflow_match(references, hypothesis, 'c')

print('ngram match: {0}, weighted ngram match: {1}, syntax_match: {2}, dataflow_match: {3}'.\
                    format(ngram_match_score, weighted_ngram_match_score, syntax_match_score, dataflow_match_score))

code_bleu_score = alpha*ngram_match_score\
                + beta*weighted_ngram_match_score\
                + gamma*syntax_match_score\
                + theta*dataflow_match_score

print('CodeBLEU score: ', code_bleu_score)




