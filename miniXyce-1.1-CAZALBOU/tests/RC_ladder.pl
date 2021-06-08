#!/usr/bin/perl

# Check input arguments
#       $ARGV[0] = number of stages in the RC ladder
#       $ARGV[1] = which binary to create netlist for
#
unless (@ARGV>=1)
    { die "There are too few arguments to run the testing script" };
#
$n_ladder=$ARGV[0];
$binary = "minixyce";
if (@ARGV>1)
  { $binary = $ARGV[1]; };
$stages = $n_ladder;
$n = $stages+1;

$R = "1e3";
$C = "1e-9";

if (lc($binary) eq "minixyce") 
{
  print "* $stages stage RC Ladder generated by running RC_ladder.pl permuted to cluster resistor and capacitors\n\n";
  print "Vs 1 0 PULSE 0 1 1e-6 0 1e-6 0 0\n\n";
}
else 
{
  print "* $stages stage RC Ladder generated by running RC_ladder.pl permuted to cluster resistor and capacitors\n\n";
  print ".tran 1e-8 5e-6\n";
  print ".options timeint method=6 newlte=0 newbpstepping=0 reltol=1e-2 conststep=1 maxord=1 delmax=1e-8 dtmin=1e-8\n";
  print ".options device DETAILED_DEVICE_COUNTS=1\n";
  print ".options linsol tr_partition=0 tr_amd=0 az_kspace=10 az_max_iter=10 az_tol=1e-6 az_precond=0 use_aztec_precond=1\n\n";
  print ".print tran V(2)\n\n";
  print "Vs 1 0 PULSE( 0 1 1e-6 0 1e-6 0 0 )\n\n";
}

for ($i=1;$i<=$n_ladder;$i++)
{
  $n1=$i;
  $n2=$i+1;

  print "R$i $n1 $n2 $R\n";
  print "C$i $n2 0 $C\n";
}

print "\n";