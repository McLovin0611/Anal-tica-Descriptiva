#Ubicar Ruta del archivo#
file.choose()

#Convertir ruta en objeto values, al ejecutar esto no es manipulable aun#
ruta_doc <- "C:\\Users\\lenovo\\Desktop\\itla\\5to Cuatrimestre\\Programacion 3\\VENTAS.xlsx"


library(readxl)

#Convertir values en data, para poder manipularla.
ventas <- read_excel(ruta_doc)

#Coeficiente de Correlación entre variables, nos muestra que tan relacionadas estan las variables#
cor(ventas)

#Gráficamente podemos representar esta correlacion entre las variables Ventas-Publicidad con esta funcion
pairs(ventas)

#Funcion para Graficar, aqui combinaremos ambas variables en un solo grafico, en el eje x estara publicidad y en el eje y ventas#
plot(ventas$Publicidad, ventas$ventas, xlab = 'Publicidad', ylab = 'ventas')

#Creamos nuestro regresion como un objeto
regresion_1 <- lm(ventas ~ Publicidad, data = ventas)

#Hagamos un resumen de la regresión 
summary(regresion_1)

#Para determinar el intervalo de Confianza del 95%
confint(regresion_1)

#Para cambiarlo a 90#
confint(regresion_1, level = 0.90)


#Tiremos una linea de tendencia
abline(regresion_1)

#Tabla Anova
anova(regresion_1)

#Para obtener los residuos y convertirlo en objeto
residuos1 <- rstandard(regresion_1)

#Para obtener los valores ajustados 
valores.ajustados1 <- fitted(regresion_1)

#graficar Residuos vs Valores Ajustados 
plot(valores.ajustados1, residuos1)
abline(h=0)


#Gráfica de Normalidad
qqnorm(residuos1)
qqline(residuos1)



#Otras Graficas
boxplot(residuos1)


hist(residuos1)