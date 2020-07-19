library(CoExpNets)
library(CoExpROSMAP)
CoExpROSMAP::initDb()
library(WGCNA)
WGCNA::enableWGCNAThreads(8)

# Cargamos la base de datos disponible
expr.data = getExprDataFromTissue(tissue="notad",
                                  which.one="CoExpROSMAP")

# Seleccionamos una submuestra de tamaño 190
set.seed(12345)
exp.data2 <- expr.data[sample(nrow(expr.data),190),]

start.time1 <- Sys.time()
# Lanzamos el proceso de creación de la red bootstrap
set.seed(12345)
getBootstrapNetwork(mode = "bootstrap",expr.data = exp.data2, 
                    job.path = "results20/",
                    removeTOMF = TRUE, blockTOM = TRUE,
                    annotateFinalNet = TRUE,
                    b = 20)
end.time1 <- Sys.time()

tiempoEjecucion1 <- end.time1 - start.time1
print(tiempoEjecucion1)

start.time2 <- Sys.time()
# Lanzamos el proceso de creación de la red bootstrap
set.seed(12345)
getBootstrapNetwork(mode = "bootstrap",expr.data = exp.data2, 
                    job.path = "results40/",
                    removeTOMF = TRUE, blockTOM = TRUE,
                    annotateFinalNet = TRUE,
                    b = 40)
end.time2 <- Sys.time()

tiempoEjecucion2 <- end.time2 - start.time2
print(tiempoEjecucion2)
