Lancer le script ./ prerequis.sh, permet d'installer les composants necessaire a l'utilisation du Terraform
Une fois l'install terminer lancer la commande aws configure et saisir les Access key ID,Secret access key
Terraform est prêt a l'emploi.
le fichier main.tf contient le provider aws et l'ensemble des ressources à créer.
terraform init ==> permet de créer et télécharger les composants relatifs à notre main
terraform plan ==> analyse le main pour savoir les actions a mener, création modification ou suppression des ressources.
terraform apply ==> applique les changements prévu dans le plan, peut être suivi de -auto-approve pour ne pas demander la validation
terraform destroy ==> supprime toutes l'architecture, peut également être suivi de -auto-approve
La partie Variable doit être déplacer dans un autre fichier (Sécurité). ==> prévue à la fin
Si le terraform est exécuter pour la première fois, il faudra retiré la partie sauvegarde de la BDD, apply le terraform, et le destroy
==> changer les params liés a la sauvegarde dans la partie Variable & data aws_db_snapshot.
En cas de changement de région, vérifié les zones des sous-réseau.
PS:
il est préférable d'avoir une machine maitre qui controle terraform pour l'architecture, chaque lancement depuis une machine différente necessite d'avoir les fichier du terraform init, risque : une duplication de la structure.


Done : 
    Partie Réseau :
        VPC
        Subnet (Pub & 2 Priv)
            1 pub : app Front
            2 priv : RDS & Back (RDS necessite 2 subnet avec zone d'availibity différente & haute disponibilité de la BDD)
        Groupe de Sécu
        Nat
        Gate way
    DataBase
        Creation de BDD RDS 
    Elastic beanStalk:
        Role (attacher a EC2)
        Instance EC2
        Attachement au VPC
        Création auto de S3
    Main
        Init terraform aws provider
    Variable
        ensemble de donnée changeable selon la structure (en cas de changement de region plusieur verification a faire)

Not Done:
    API GateWay
    Cognito (à vérifier)
    Amplify
    changer les users/password de la RDS
    revoir le snapshot RDS
