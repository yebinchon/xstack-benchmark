#include <stdio.h>
#include <stdlib.h> // Nick: for free()

unsigned NUM_NODES;

#define NONE                               9999

struct _NODE
{
  int iDist;
  int iPrev;
};
typedef struct _NODE NODE;

struct _QITEM
{
  int iNode;
  int iDist;
  int iPrev;
  struct _QITEM *qNext;
};
typedef struct _QITEM QITEM;

//QITEM *qHead = NULL;


//int AdjMatrix[NUM_NODES][NUM_NODES];
//NODE rgnNodes[NUM_NODES];
//int **AdjMatrix;
int **AdjMatrixInit;
//NODE *rgnNodes;

//void allocate_matrices()
//{
//  AdjMatrix = (int**) malloc( NUM_NODES * sizeof(int*) );
//  for(int i=0; i<NUM_NODES; ++i)
//    AdjMatrix[i] = (int*) malloc( NUM_NODES * sizeof(int) );
//
//  rgnNodes = (NODE*) malloc( NUM_NODES * sizeof(NODE) );
//}
//
//void free_matrices()
//{
//  free( rgnNodes );
//
//  for(int i=0; i<NUM_NODES; ++i)
//    free( AdjMatrix[i] );
//  free( AdjMatrix );
//}


//int g_qCount = 0;
//int ch;
//int iPrev, iNode;
//int i, iCost, iDist;
//int iCost, iDist;


void print_path (NODE *rgnNodes, int chNode)
{
  if (rgnNodes[chNode].iPrev != NONE)
  {
    print_path(rgnNodes, rgnNodes[chNode].iPrev);
  }
  printf (" %d", chNode);
  fflush(stdout);
}


void enqueue (int iNode, int iDist, int iPrev, int *g_qCount, QITEM **qHead)
{
  QITEM *qNew = (QITEM *) malloc(sizeof(QITEM));
  QITEM *qLast = *qHead;

  if (!qNew)
  {
    fprintf(stderr, "Out of memory.\n");
    exit(1);
  }
  qNew->iNode = iNode;
  qNew->iDist = iDist;
  qNew->iPrev = iPrev;
  qNew->qNext = NULL;

  if (!qLast)
  {
    *qHead = qNew;
  }
  else
  {
    while (qLast->qNext) qLast = qLast->qNext;
    qLast->qNext = qNew;
  }
  *g_qCount = *g_qCount+1;
  //               ASSERT(g_qCount);
}


void dequeue (int *piNode, int *piDist, int *piPrev, int *g_qCount, QITEM **qHead)
{
  QITEM *qKill = *qHead;

  //SUSAN:
  //if (qHead)
  //{
    //                 ASSERT(g_qCount);
    *piNode = (*qHead)->iNode;
    *piDist = (*qHead)->iDist;
    *piPrev = (*qHead)->iPrev;
    *qHead = (*qHead)->qNext;
    free(qKill);
    //g_qCount--;
    *g_qCount = *g_qCount - 1;
  //}
}


//int qcount (void)
//{
//  return(g_qCount);
//}

int dijkstra(int chStart, int chEnd, int** AdjMatrix, NODE *rgnNodes, QITEM *qHead)
{
  for (int ch = 0; ch < NUM_NODES; ch++)
  {
    rgnNodes[ch].iDist = NONE;
    rgnNodes[ch].iPrev = NONE;
  }

  if (chStart == chEnd)
  {
    printf("Shortest path is 0 in cost. Just stay where you are.\n");
  }
  else
  {
    rgnNodes[chStart].iDist = 0;
    rgnNodes[chStart].iPrev = NONE;

    int g_qCount = 0;
    enqueue (chStart, 0, NONE, &g_qCount, &qHead);

    int iNode, iDist, iPrev, iCost;
    while (g_qCount > 0)
    {
      dequeue (&iNode, &iDist, &iPrev, &g_qCount, &qHead);
      for (int i = 0; i < NUM_NODES; i++)
      {
        if ((iCost = AdjMatrix[iNode][i]) != NONE)
        {
          if ((NONE == rgnNodes[i].iDist) ||
              (rgnNodes[i].iDist > (iCost + iDist)))
          {
            rgnNodes[i].iDist = iDist + iCost;
            rgnNodes[i].iPrev = iNode;
            enqueue (i, iDist + iCost, iNode, &g_qCount, &qHead);
          }
        }
      }
    }

    printf("Shortest path is %d in cost. ", rgnNodes[chEnd].iDist);
    printf("Path is: ");
    print_path(rgnNodes, chEnd);
    printf("\n");
  }
}

int main(int argc, char *argv[]) {
  int i,j,k;
  FILE *fp;

  if (argc<3) {//Nick
    fprintf(stderr, "Usage: dijkstra <filename> <size>\n");
  }

  /* open the adjacency matrix file */
  fp = fopen (argv[1],"r");
  NUM_NODES = atoi( argv[2] );//Nick


  /* finds 10 shortest paths between nodes */
  const int N = NUM_NODES;

  AdjMatrixInit = (int**) malloc( NUM_NODES * sizeof(int*) );
  for(int i=0; i<NUM_NODES; ++i)
    AdjMatrixInit[i] = (int*) malloc( NUM_NODES * sizeof(int) );

  fp = fopen (argv[1],"r");
  for (int i=0;i<NUM_NODES;i++) {
    for (int j=0;j<NUM_NODES;j++) {
      fscanf(fp,"%d",&k);
      AdjMatrixInit[i][j]= k;
    }
  }

  //HOT LOOP
  #pragma omp parallel for
  for (int i=0;i<N;i++) {
    //SUSAN:
    //allocate_matrices();
    int **AdjMatrix = (int**) malloc( NUM_NODES * sizeof(int*) );
    for(int i=0; i<NUM_NODES; ++i)
      AdjMatrix[i] = (int*) malloc( NUM_NODES * sizeof(int) );

    NODE *rgnNodes = (NODE*) malloc( NUM_NODES * sizeof(NODE) );

    for (int i=0;i<NUM_NODES;i++) {
      for (int j=0;j<NUM_NODES;j++) {
        AdjMatrix[i][j]= AdjMatrixInit[i][j];
      }
    }

    int j=(i+N/2)%N;
    QITEM *qHead = NULL;
    dijkstra(i,j,AdjMatrix,rgnNodes, qHead);

    //SUSAN:
    //free_matrices();
    free( rgnNodes );

    for(int i=0; i<NUM_NODES; ++i)
      free( AdjMatrix[i] );
    free( AdjMatrix );
  }

  //SUSAN: free init
  for(int i=0; i<NUM_NODES; ++i)
    free( AdjMatrixInit[i] );
  free( AdjMatrixInit );

  exit(0);
}
