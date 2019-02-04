#include "C:/Users/lmi/Documents/Visual Studio 2010/Projects/matrix_multiplication/common/book.h"
#include<cuda.h>

#define N 128
//const int threadPerBlock=256;
//const int blockPerGrid=imin(32,(N+threadPerBlock-1)/threadPerBlock);


__global__ void multiplication(float *a, float *b, float *c, int M) {
	int col = threadIdx.x + blockIdx.x*blockDim.x;
	int row = threadIdx.y + blockIdx.y*blockDim.y;
	float sum=0;
	if(col<M && row<M){ 
		for(int k=0; k<M; k++)
			sum+=a[row*M+k]*b[k*M+col];
//		col+=grid.x*gridDim.x;
//		row+=grid.y*gridDim.y;
	    c[row*M+col]=sum;	
	}
}

int main(){
	float a[N][N], b[N][N],c[N][N],c_test[N][N];
	float *dev_a, *dev_b, *dev_c;
	dim3 blocks(N/16,N/16);
	dim3 threads(16,16);

	
	HANDLE_ERROR(cudaMalloc((void **)&dev_a, N*N*sizeof(float)));
	HANDLE_ERROR(cudaMalloc((void **)&dev_b, N*N*sizeof(float)));
	HANDLE_ERROR(cudaMalloc((void **)&dev_c, N*N*sizeof(float)));

	for(int i=0; i<N; i++){
		for(int j=0; j<N; j++){
			a[i][j]=i;
			b[i][j]=2*i;
		}
	}

	HANDLE_ERROR(cudaMemcpy(dev_a, a, N*N*sizeof(float), cudaMemcpyHostToDevice));
    HANDLE_ERROR(cudaMemcpy(dev_b, b, N*N*sizeof(float), cudaMemcpyHostToDevice));

	multiplication<<<blocks, threads>>>(dev_a, dev_b, dev_c, N);

	HANDLE_ERROR(cudaMemcpy(c, dev_c, N*N*sizeof(float), cudaMemcpyDeviceToHost));

	
	for(int i=0; i<N; i++){
		for(int j=0; j<N;j++){
			float tem=0;
			for(int k=0;k<N;k++)
				tem+=a[i][k]+b[k][j];
			c_test[i][j]=tem;
		}
	}

	bool success=true;
	for(int i=0; i<N; i++){
		for(int j=0; j<N; j++){
			if(c[i][j]!=c_test[i][j]) success=false;
		}
	}

	if(success) printf("we made it!");

	cudaFree(dev_a);
	cudaFree(dev_b);
	cudaFree(dev_c);

	delete [] a;
	delete [] b;
	delete [] c;
	delete [] c_test;

	return (0);
}