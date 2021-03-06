#include <kernel_config.cuh>
#include <qs_launchers.cuh>
#include <qs_recursion.cuh>
#include <qs_recursion_multi.cuh>
#include <ssss_recursion.cuh>
#include <ssss_recursion_multi.cuh>
#include <ssss_launchers.cuh>
namespace gpu {
template void sampleselect_multi<double,select_config<8, 10, 8, false, true, true, 8, 10, 10>>(double* in, double* tmp, index size, const index* ranks, index rank_count, index* tmp_storage, index* aux_storage, index* aux_atomic, double* out);
template __host__ __device__ void collect_buckets<double,select_config<10, 10, 8, false, false, true, 8, 10, 10>>(const double* data, const poracle* oracles_packed, const index* block_prefix_sum, const index* bucket_out_ranges, double* out, index size, mask* buckets, index* atomic);
template __global__ void kernels::count_buckets<double, select_config<10, 10, 8, true, false, false, 8, 10, 10>>(const double* in, const double* tree, index* counts, poracle* oracles, index size, index workcount);
template void sampleselect<float,select_config<10, 10, 8, true, true, true, 8, 10, 10, false, 4>>(float* in, float* tmp, float* tree, index* count_tmp, index size, index rank, float* out);
template __global__ void kernels::partition_distr<float,select_config<10, 10, 8, false, true, true, 8, 10, 10>>(const float* in, float* out, const index* counts, index size, float pivot, index workcount);
template __host__ __device__ void build_searchtree<float,select_config<10, 11, 9, false, true, false, 8, 10, 10>>(const float* in, float* out, index size);
template __global__ void partition_count<float,select_config<10, 10, 8, false, true, true, 8, 10, 10>>(const float* in, index* counts, index size, float pivot, index workcount);
template __host__ __device__ void count_buckets<double,select_config<10, 10, 8, true, false, true, 8, 10, 10>>(const double* in, const double* tree, index* localcounts, index* counts, poracle* oracles, index size);
template void quickselect<double,select_config<10, 10, 8, true, true, true, 8, 9, 10>>(double* in, double* tmp, index* count_tmp, index size, index rank, double* out);
template void sampleselect<float,select_config<10, 10, 8, true, true, true, 8, 8, 10>>(float* in, float* tmp, float* tree, index* count_tmp, index size, index rank, float* out);
}