#install.packages("gkmSVM")
#BiocManager::install("GenomicRanges")
#BiocManager::install("rtracklayer")

library(argparser)
library(gkmSVM)
library(BSgenome.Hsapiens.UCSC.hg38.masked)

parser <- arg_parser("Get null sequences")
parser <- add_argument(parser, "--input_bed", help="input_bed")
parser <- add_argument(parser, "--output_bed", help="output_bed")
args <- parse_args(parser)

genNullSeqs(
  args$input_bed,
  genomeVersion='hg38',
  outputBedFN = args$output_bed,
  outputPosFastaFN = 'temp1.fa',
  outputNegFastaFN = 'temp2.fa',
  xfold = 3,
  repeat_match_tol = 0.02,
  GC_match_tol = 0.02,
  length_match_tol = 0,
  batchsize = 5000, 
  nMaxTrials = 50,
  genome=BSgenome.Hsapiens.UCSC.hg38.masked)

file.remove("temp1.fa")
file.remove("temp2.fa")

