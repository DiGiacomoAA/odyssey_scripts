#!/bin/bash
#SBATCH -n 4 # Number of cores requested
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH -t 2880 # Runtime in minutes
#SBATCH -p serial_requeue # Partition to submit to
#SBATCH --mem=10000 # Memory per cpu in MB (see also --mem-per-cpu)
#SBATCH --open-mode=append
#SBATCH -o alcid_RaxML_combined_multistate_%j.out # Standard out goes to this file
#SBATCH -e alcid_RaxML_combined_multistate_%j.err # Standard err goes to this filehostname
hostname

module load gcc/7.1.0-fasrc01 openmpi/2.1.0-fasrc02 RAxML/8.2.11-fasrc02

raxmlHPC-HYBRID-SSE3 -T 4 -f a -n RaxML_combined_multistate -s auk_combined_multistate_raxml.phy -N 1000 -p 48652 -q auk_combined_multistate_raxml_partitions.txt -m GTRGAMMAI -K MK -x 12345 -o Charadrius_vociferus,Charadrius_wilsonia
