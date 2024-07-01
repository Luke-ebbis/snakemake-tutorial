library(tidyverse)
library(argparse)

parser <- ArgumentParser(description="Plotting the depth of a contig")
parser$add_argument('--input', '-i')
parser$add_argument('--output', '-o')
xargs <- parser$parse_args()

x  <- read.table(xargs$input, sep="\t", header=FALSE, strip.white=TRUE)
print(tibble(x))
covplot <- ggplot(x, aes(x=V2, y=V3)) +
  geom_point() +
  labs(x = "Possition on scaffold",
       y = "Coverage")

ggsave(xargs$output,
  width = 10,
  height = 6)
