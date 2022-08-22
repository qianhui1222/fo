#################################################################################################
# Compute neoantigen fitness cost (recognition potential)
#
# Directory structure:
#
# InputData:
#   1. neoantigen-data files for 3 cohorts (Van Allen et al., Snyder et al. and Rizvi et al.)
#   2. iedb.fasta: fasta file with IEDB epitope sequences
#   3. neoantigen alignment folders with precomputed blastp alignments for all neoantigens, split into files for each sample.
#    eg. run as
#    blastp -query <InputData/neoantigen_alignments_Rizvi/neoantigens_AL4602.fasta> -db InputData/iedb.fasta -outfmt 5 -evalue 100000000  -gapopen 11 -gapextend 1 > <InputData/neoantigen_alignments_Rizvi/neoantigens_AL4602.xml>
#
# src: 
#   source code folder
#
# Output:
#   source code output folder: neoantigens with computed fitness cost
#################################################################################################
#
# fitness model parameters
a=26.
k=4.86936

python src/main.py InputData/neoantigens_VanAllen.txt InputData/neoantigen_alignments_VanAllen $a $k Output/neoantigen_fitness_VanAllen.txt
python src/main.py InputData/neoantigens_Snyder.txt InputData/neoantigen_alignments_Snyder $a $k Output/neoantigen_fitness_Snyder.txt
python src/main.py InputData/neoantigens_Rizvi.txt InputData/neoantigen_alignments_Rizvi $a $k Output/neoantigen_fitness_Rizvi.txt
