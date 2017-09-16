awk -f tsv2gyms.awk gyms.tsv >gymsbody.html
cat gyms-prefix.html gymsbody.html >index.html
