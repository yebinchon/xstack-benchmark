int x[10] = {2,4,10,2,5,0,9,6,7,9};

int never_called(int i){
  do {} while (i++ < 75);
}

int main(){
  int sum = 0;
  for(int i=0; i<10; i++){
    if(x[i]>3)
      sum+=x[i];
  }

  return sum;
}

