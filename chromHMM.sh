for i in $(seq 10 +1 30); do
        echo 'runing '$i' states'
        java -mx1600M -jar ~/tools/ChromHMM/ChromHMM.jar LearnModel -p 5 ~/projects/t2d/chipseq/chromHMM/binfile/ ~/projects/t2d/chipseq/chromHMM/models $i hg18
done
