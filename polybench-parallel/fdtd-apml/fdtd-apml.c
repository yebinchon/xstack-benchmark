/**
 * fdtd-apml.c: This file is part of the PolyBench 3.0 test suite.
 *
 *
 * Contact: Louis-Noel Pouchet <pouchet@cse.ohio-state.edu>
 * Web address: http://polybench.sourceforge.net
 */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <math.h>

/* Array initialization. */
static
void init_array (int cz,
		 int cxm,
		 int cym,
		 double *mui,
		 double *ch,
		 double Ax[cz+1][cym+1],
		 double Ry[cz+1][cym+1],
		 double Ex[cz+1][cym+1][cxm+1],
		 double Ey[cz+1][cym+1][cxm+1],
		 double Hz[cz+1][cym+1][cxm+1],
		 double czm[cz+1],
		 double czp[cz+1],
		 double cxmh[cxm+1],
		 double cxph[cxm+1],
		 double cymh[cym+1],
		 double cyph[cym+1])
{
  int i, j, k;
  *mui = 2341;
  *ch = 42;
  for (i = 0; i <= cz; i++)
    {
      czm[i] = ((double) i + 1) / cxm;
      czp[i] = ((double) i + 2) / cxm;
    }
  for (i = 0; i <= cxm; i++)
    {
      cxmh[i] = ((double) i + 3) / cxm;
      cxph[i] = ((double) i + 4) / cxm;
    }
  for (i = 0; i <= cym; i++)
    {
      cymh[i] = ((double) i + 5) / cxm;
      cyph[i] = ((double) i + 6) / cxm;
    }

  for (i = 0; i <= cz; i++)
    for (j = 0; j <= cym; j++)
      {
	Ry[i][j] = ((double) i*(j+1) + 10) / cym;
	Ax[i][j] = ((double) i*(j+2) + 11) / cym;
	for (k = 0; k <= cxm; k++)
	  {
	    Ex[i][j][k] = ((double) i*(j+3) + k + 1) / cxm;
	    Ey[i][j][k] = ((double) i*(j+4) + k + 2) / cym;
	    Hz[i][j][k] = ((double) i*(j+5) + k + 3) / cz;
	  }
      }
}


/* DCE code. Must scan the entire live-out data.
   Can be used also to check the correctness of the output. */
static
void print_array(int cz,
		 int cxm,
		 int cym,
		 double Bza[cz+1][cym+1][cxm+1],
		 double Ex[cz+1][cym+1][cxm+1],
		 double Ey[cz+1][cym+1][cxm+1],
		 double Hz[cz+1][cym+1][cxm+1])
{
  int i, j, k;

  for (i = 0; i <= cz; i++)
    for (j = 0; j <= cym; j++)
      for (k = 0; k <= cxm; k++) {
	fprintf(stderr, "%0.2lf ", Bza[i][j][k]);
	fprintf(stderr, "%0.2lf ", Ex[i][j][k]);
	fprintf(stderr, "%0.2lf ", Ey[i][j][k]);
	fprintf(stderr, "%0.2lf ", Hz[i][j][k]);
	if ((i * cxm + j) % 20 == 0) fprintf(stderr, "\n");
      }
  fprintf(stderr, "\n");
}


/* Main computational kernel. The whole function will be timed,
   including the call and return. */
static
void kernel_fdtd_apml(int cz,
		      int cxm,
		      int cym,
		      double mui,
		      double ch,
		 double Ax[cz+1][cym+1],
		 double Ry[cz+1][cym+1],
     double clf[cym+1][cxm+1],
     double tmp[cym+1][cxm+1],
     double Bza[cz+1][cym+1][cxm+1],
		 double Ex[cz+1][cym+1][cxm+1],
		 double Ey[cz+1][cym+1][cxm+1],
		 double Hz[cz+1][cym+1][cxm+1],
		 double czm[cz+1],
		 double czp[cz+1],
		 double cxmh[cxm+1],
		 double cxph[cxm+1],
		 double cymh[cym+1],
		 double cyph[cym+1])
{
  int iz, iy, ix;

//#pragma scop
//#pragma omp parallel
{
//  #pragma omp for private (iy, ix)
  for (iz = 0; iz < cz; iz++)
    {
      for (iy = 0; iy < cym; iy++)
	{
	  for (ix = 0; ix < cxm; ix++)
	    {
	      clf[iz][iy] = Ex[iz][iy][ix] - Ex[iz][iy+1][ix] + Ey[iz][iy][ix+1] - Ey[iz][iy][ix];
	      tmp[iz][iy] = (cymh[iy] / cyph[iy]) * Bza[iz][iy][ix] - (ch / cyph[iy]) * clf[iz][iy];
	      Hz[iz][iy][ix] = (cxmh[ix] /cxph[ix]) * Hz[iz][iy][ix]
		+ (mui * czp[iz] / cxph[ix]) * tmp[iz][iy]
		- (mui * czm[iz] / cxph[ix]) * Bza[iz][iy][ix];
	      Bza[iz][iy][ix] = tmp[iz][iy];
	    }
	  clf[iz][iy] = Ex[iz][iy][cxm] - Ex[iz][iy+1][cxm] + Ry[iz][iy] - Ey[iz][iy][cxm];
	  tmp[iz][iy] = (cymh[iy] / cyph[iy]) * Bza[iz][iy][cxm] - (ch / cyph[iy]) * clf[iz][iy];
	  Hz[iz][iy][cxm]=(cxmh[cxm] / cxph[cxm]) * Hz[iz][iy][cxm]
	    + (mui * czp[iz] / cxph[cxm]) * tmp[iz][iy]
	    - (mui * czm[iz] / cxph[cxm]) * Bza[iz][iy][cxm];
	  Bza[iz][iy][cxm] = tmp[iz][iy];
	  for (ix = 0; ix < cxm; ix++)
	    {
	      clf[iz][iy] = Ex[iz][cym][ix] - Ax[iz][ix] + Ey[iz][cym][ix+1] - Ey[iz][cym][ix];
	      tmp[iz][iy] = (cymh[cym] / cyph[iy]) * Bza[iz][iy][ix] - (ch / cyph[iy]) * clf[iz][iy];
	      Hz[iz][cym][ix] = (cxmh[ix] / cxph[ix]) * Hz[iz][cym][ix]
		+ (mui * czp[iz] / cxph[ix]) * tmp[iz][iy]
		- (mui * czm[iz] / cxph[ix]) * Bza[iz][cym][ix];
	      Bza[iz][cym][ix] = tmp[iz][iy];
	    }
	  clf[iz][iy] = Ex[iz][cym][cxm] - Ax[iz][cxm] + Ry[iz][cym] - Ey[iz][cym][cxm];
	  tmp[iz][iy] = (cymh[cym] / cyph[cym]) * Bza[iz][cym][cxm] - (ch / cyph[cym]) * clf[iz][iy];
	  Hz[iz][cym][cxm] = (cxmh[cxm] / cxph[cxm]) * Hz[iz][cym][cxm]
	    + (mui * czp[iz] / cxph[cxm]) * tmp[iz][iy]
	    - (mui * czm[iz] / cxph[cxm]) * Bza[iz][cym][cxm];
	  Bza[iz][cym][cxm] = tmp[iz][iy];
	}
    }
}
//#pragma endscop

}


int main(int argc, char** argv)
{
  /* Retrieve problem size. */
  int cz = atoi(argv[2]);
  int cym = atoi(argv[3]);
  int cxm = atoi(argv[4]);
  int dump_code = atoi(argv[1]);

  /* Variable declaration/allocation. */
  double mui;
  double ch;
  double (*Ax)[cz+1][cym+1]; Ax = (double(*)[cz+1][cym+1])malloc((cz+1)*(cym+1)*sizeof(double));
  double (*Ry)[cz+1][cym+1]; Ry = (double(*)[cz+1][cym+1])malloc((cz+1)*(cym+1)*sizeof(double));
  double (*clf)[cym+1][cxm+1]; clf = (double(*)[cym+1][cxm+1])malloc((cym+1)*(cxm+1)*sizeof(double));
  double (*tmp)[cym+1][cxm+1]; tmp = (double(*)[cym+1][cxm+1])malloc((cym+1)*(cxm+1)*sizeof(double));
  double (*Bza)[cz+1][cym+1][cxm+1]; Bza = (double(*)[cz+1][cym+1][cxm+1])malloc((cz+1)*(cxm+1)*(cym+1)*sizeof(double));
  double (*Ex)[cz+1][cym+1][cxm+1]; Ex = (double(*)[cz+1][cym+1][cxm+1])malloc((cz+1)*(cxm+1)*(cym+1)*sizeof(double));
  double (*Ey)[cz+1][cym+1][cxm+1]; Ey = (double(*)[cz+1][cym+1][cxm+1])malloc((cz+1)*(cxm+1)*(cym+1)*sizeof(double));
  double (*Hz)[cz+1][cym+1][cxm+1]; Hz = (double(*)[cz+1][cym+1][cxm+1])malloc((cz+1)*(cxm+1)*(cym+1)*sizeof(double));
  double (*czm)[cz+1]; czm = (double(*)[cz+1])malloc((cz+1)*sizeof(double));
  double (*czp)[cz+1]; czp = (double(*)[cz+1])malloc((cz+1)*sizeof(double));
  double (*cxmh)[cxm+1]; cxmh = (double(*)[cxm+1])malloc((cxm+1)*sizeof(double));
  double (*cxph)[cxm+1]; cxph = (double(*)[cxm+1])malloc((cxm+1)*sizeof(double));
  double (*cymh)[cym+1]; cymh = (double(*)[cym+1])malloc((cym+1)*sizeof(double));
  double (*cyph)[cym+1]; cyph = (double(*)[cym+1])malloc((cym+1)*sizeof(double));

  /* Initialize array(s). */
  init_array (cz, cxm, cym, &mui, &ch,
  	      *Ax,
  	      *Ry,
  	      *Ex,
  	      *Ey,
  	      *Hz,
  	      *czm,
  	      *czp,
  	      *cxmh,
  	      *cxph,
  	      *cymh,
  	      *cyph);

  /* Run kernel. */
  kernel_fdtd_apml (cz, cxm, cym, mui, ch,
  		    *Ax,
  		    *Ry,
  		    *clf,
  		    *tmp,
  		    *Bza,
  		    *Ex,
  		    *Ey,
  		    *Hz,
  		    *czm,
  		    *czp,
  		    *cxmh,
  		    *cxph,
  		    *cymh,
  		    *cyph);

  /* Prevent dead-code elimination. All live-out data must be printed
     by the function call in argument. */
  if(dump_code == 1) print_array(cz,cxm, cym, *Bza, *Ex, *Ey, *Hz);

  /* Be clean. */
  free((void*)Ax);
  free((void*)Ry);
  free((void*)clf);
  free((void*)tmp);
  free((void*)Bza);
  free((void*)Ex);
  free((void*)Ey);
  free((void*)Hz);
  free((void*)czm);
  free((void*)czp);
  free((void*)cxmh);
  free((void*)cxph);
  free((void*)cymh);
  free((void*)cyph);

  return 0;
}

