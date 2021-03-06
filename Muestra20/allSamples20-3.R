library(CoExpNets)
library(CoExpROSMAP)
CoExpROSMAP::initDb()
library(WGCNA)
WGCNA::enableWGCNAThreads(6)

# Cargamos la base de datos disponible
expr.data = getExprDataFromTissue(tissue="notad",
                                  which.one="CoExpROSMAP")

# Seleccionamos una submuestra de tamaño 20
set.seed(1234567)
exp.data2 <- expr.data[sample(nrow(expr.data),20),]

start.time1 <- Sys.time()
net = CoExpNets::getDownstreamNetwork(tissue="netAllSamples20.3",
                                      n.iterations=50,
                                      net.type = "signed",
                                      debug=F,
                                      expr.data=exp.data2,
                                      job.path="RedAllSamples3/",
                                      min.cluster.size = 100)
end.time1 <- Sys.time()
end.time1 - start.time1