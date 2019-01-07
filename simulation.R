#AR(3), M=4
library(grDevices)

set.seed(986742)

#Sample size
n<-500
#AR multipliers
phi<-c(.6,-.2,.1)
#d.f.
nu<-4
#AR scale
sigma2<-0.05

#Simulating AR model
sims<-function(n,phi,nu,sigma2){
  p<-length(phi)
  yt<-rep(0,p)
  for(i in 1:n){
    lam<-rgamma(1,nu/2,nu/2)
    yt[i+p]<-rnorm(1,sum(phi*yt[i+p-(1:p)]),sqrt(sigma2/lam))
  }
  yt<-yt[-(1:p)]
  return(yt)
}
yt<-sims(n,phi,nu,sigma2)

#Simulating the data
rald<-function(n,mu,sigma,tau){
  Z<-rnorm(n)
  U<-rexp(n)
  k1<-(1-2*tau)/(tau*(1-tau))
  k2<-2/(tau*(1-tau))
  Y<-sigma*(k1*U+sqrt(k2*U)*Z)+mu
  return(Y)
}
M<-4
sigma<-c(.06,.1,.08,.04)
tau<-c(.3,.4,.6,.7)
ytm<-matrix(0,nrow=n,ncol=M)
for(j in 1:M){
  for(i in 1:n)  ytm[i,j]<-rald(1,yt[i],sigma[j],tau[j])
}

#Graphical comparison
plot(c(1,n),c(min(ytm),max(ytm)+1),type='n',ylab='',xlab='Time',main='Simulated data')
for(i in 1:M){
  lines(ytm[,i],type='l',col=adjustcolor(i+1, alpha.f = 0.5),lwd=2)
}
lines(yt,type='l',col='black',lwd=2,lty=2)
legend('topleft',c(paste('Method ',1:M),'True value'),col=c(adjustcolor(2:(M+1), alpha.f = 0.5),1),lty=c(rep(1,M),2),bty='n',cex=1)

