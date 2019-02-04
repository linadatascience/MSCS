#include <C:/Program Files (x86)/Microsoft Visual Studio 14.0/VC/include/common/book.h>

#define N 64

__global__ void add(int *a, int *b, int *c) {
	int x = threadIdx.x + blockIdx.x*blockDim.x;
	int y = threadIdx.y + blockIdx.y*blockDim.y;
	while (x < N & y < N) 
		c[y][x] = a[y][x] + b[y][x];
	    x+=grid.x*gridDim.x;
		y+=grid.y*gridDim.y;
}

int main(void) {
	int a[N][N], b[N][N], c[N][N];
	int (*dev_a)[N][N], (*dev_b)[N][N], (*dev_c)[N][N];
	dim3 blocks(N/16,N/16);
	dim3 threads(16,16);

	//allocate the memory on the GPU
	HANDLE_ERROR(cudaMalloc((void**) &dev_a, N*N*sizeof(int));
	HANDLE_ERROR(cudaMalloc((void**) &dev_b, N*N*sizeof(int));
	HANDLE_ERROR(cudaMalloc((void**) &dev_c, N*N*sizeof(int));

	//initiate the matrixes that will be added
	for (i = 0; i < N; i++) {
		for (j = 0; j < N; j++) {
			a[i][j] = i*N + j;
			b[i][j] = 2 * (i*N + j);

		}
	}

	//copy initialized matrixes a and b to GPU
	HANDLE_ERROR(cudaMemcpy(dev_a, a, N*N*sizeof(int), cudaMemcpyHostToDevice));
	HANDLE_ERROR(cudaMemcpy(dev_b, b, N*N*sizeof(int), cudaMemcpyHostToDevice));

	//launch the addition function on GPU
	add << <blocks, threads >> > (dev_a, dev_b, dev_c);

	//copy the sum of two matrixes back to CPU
	HANDLE_ERROR(cudaMemcpy(c, dev_c, N*N*sizeof(int), cudaMemcpyDeviceToHost));

	//display the result of addition of two matrixes
	for (i = 0; i < N; i++) {
		for (j = 0; j < N; j++) {
			print("%d+%d=%d\n", a[i][j], b[i][j], c[i][j]);
		}
	}
}