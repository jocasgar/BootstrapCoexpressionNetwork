library(CoExpNets)
library(CoExpROSMAP)
CoExpROSMAP::initDb()
library(WGCNA)
WGCNA::enableWGCNAThreads(6)

# Cargamos la base de datos disponible
expr.data = getExprDataFromTissue(tissue="notad",
                                  which.one="CoExpROSMAP")

# Seleccionamos una submuestra de tamaÃÂ±o 190
set.seed(123)
exp.data2 <- expr.data[sample(nrow(expr.data),30),]

start.time1 <- Sys.time()
net = CoExpNets::getDownstreamNetwork(tissue="netAllSamples30.32",
                                      n.iterations=50,
                                      net.type = "signed",
                                      debug=F,
                                      expr.data=exp.data2,
                                      job.path="RedAllSamples32/",
                                      min.cluster.size = 100)
end.time1 <- Sys.time()
end.time1 - start.time1