0)Πηγαίνουμε στο https://github.com/aarsakian/HW/tree/master/config
και κάνουμε λήψη των 4 αρχείων. https://github.com/aarsakian/HW/archive/master.zip

Εγκαταστήστε το VirtualBox https://www.virtualbox.org

To Λ/Σ θα δεσμεύσει 20GB από το σκληρό σας δίσκο +1GB για τα iso αρχεία.

1 Εγκατάσταση του Centos5.6 i386 32bit 

1-α)Λήψη του packer από την σελίδα http://www.packer.io

1-β)Γράφουμε την εντολή packer build machine.json. Στον ίδιο φάκελο θα χρειαστούμε εκτός από το machine.json και το αρχείο virtualbox.sh. 
Το packer θα αρχίσει να δημιουργεί το box αρχείο που χρειάζεται το vagrant. 

Αν ολοκληρωθεί επιτυχώς θα δείτε το αρχείο CentOS-6.5-i386-ja.box 


1-γ)Κάνουμε αρχικόποιηση του εικονικού Λ/Σ. Λήψη του vagrant από http://www.vagrantup.com/

1-δ)γράφουμε την εντολή στο φάκελο όπου τρέξαμε το packer:
    vagrant init Centos65i386 CentOS-6.5-i386-ja.box 
   Αυτό θα πάρει κάποιο χρόνο. 
  
1-ε)Θα φτιάξει ένα αρχείο vagrantfile. Δοκιμάστε αν δουλεύει το εικονικό Λ/Σ με την εντολή vagrant up  
     Εφόσον είναι όλα καλά προσθέστε στη γραμμή 20 περίπου την παρακάτω εντολή 
   config.vm.network :forwarded_port, guest: 8080, host: 8002 
  Δείτε αν θέλετε τα αρχείο Vagrantfile που θα έχετε κάνει λήψη στο στάδιο 0.
  Στη συνέχεια γράφετε vagrant reload

2)Δημιουργίας Βασικής Υποδομής στο Λ/Σ.

 2-α)Γράφετε vagrant ssh (εφόσον έχετε ενεργοποίησε το vagrant με την εντολή vagrant up)
  και συνδέεστε στο Λ/Σ. Δείτε αν έχετε shared folders 
  γράφετε ls -l /vagrant/
  θα πρέπει να δείτε τα αρχεία της διαδρομής όπου εγκαταστήσατε το Λ/Σ.

  2-β)τρέξτε το αρχείο infrastructure.sh με την εντολή source /vagrant/infrastructure.sh
     αυτό θα εγκαταστήσει βιβλιοθήκες για το lapis.
 
 2-γ)Όταν τελείωσει θα πρέπει να έχετε ένα φάκελο HW στο /home/vagrant
      Ο φάκελος HW έχει δημιουργήσει ένα εικονικό περιβάλλον ώστε να έχουμε τις βιβλιοθήκες εγκαταστημένες τοπικά επι το πλείστον και να μη μολύνουμε το 
      σύστημα μας.
      cd /home/vagrant/HW
      source bin/activate (ενεργοποίηση του Εικ. Περ.)
      cd HWApp
      Τώρα βρίσκεστε στο περίβαλλον της εφαρμογής 

   2-δ)εκτελέστε lapis server & θα αρχίσει να τρέχει η εφαρμογή 
       δοκιμάστε με curl -v localhost:8080

   2-ε)εφόσον τρέχει επιτυχώς απενεργοποίηστε το firewall με sudo service iptables stop
      ανοίξτε το browser και γράψτε localhost:8002.
      Συγχαρητήρια ας ξεκινήσει το development.

  3)Github, 
    Η ανάπτυξη κώδικα θα γίνεται με το git, θα πρέπει να φτιάξετε το δημόσιο κλειδί σας με το ssh και να κάνετε λογαριασμό στο github.com
    Στη συνέχεια θα εισάγετε το κλειδί σας στο εικονικό Λ/Σ για να μπορείτε να κάνετε commit/push κ.τ.λ. στο github.com καθώς από εκεί θα μοιράζομαστε τον κώδικα. 
  

Φυσικά τα παραπάνω είναι ένα αρχικό στάδιο και μπορεί να γίνουν αλλαγές.
Καλό θα είναι εξοικοιωθείτε με το command line (linux), ssh και τη χρήση κλειδιών και στη συνέχεια με τη lua αν και μάλλον θα γράφουμε moonscript που είναι ακόμα πιο απλή αλλά το συζητάμε αυτό στο μοίρασμα της δουλειάς όταν με το καλό αρχίσουμε.

Είναι η πρώτη μου φορά που ασχολούμαι με στήσιμο υποδομής σε εικονικό περιβάλλον οπότε μην απελπίζεστε αν υπάρχουν πρόβληματα. 
