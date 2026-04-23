#!/usr/bin/env zsh

# useful aliases for kubernetes / kubectl
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
alias kgd='kubectl get deploy'
alias kgn='kubectl get nodes -o wide'
alias kga='kubectl get all'
alias kctx='kubectl config current-context'
alias kns='kubectl config view --minify --output "jsonpath={..namespace}" ; echo'
alias kd='kubectl describe'
alias kl='kubectl logs'
alias ke='kubectl exec -it'
alias kaf='kubectl apply -f'
alias kdf='kubectl delete -f'
alias kdelp='kubectl delete pod'
alias kdeldep='kubectl delete deployment'
alias kroll='kubectl rollout restart deployment'