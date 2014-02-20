ssh-keygen -t rsa -C "kevinyeah@utexas.edu"
ssh-add id_rsa

# Afterwards, copy id_rsa.pub contents and add to your github account.
# Test with ssh -T git@github.com
