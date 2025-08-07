extends Node

var openLaptop := false
var canOpenLaptop := true

#AwaitTime
var bonnieWaitTime := 5
var chicaWaitTime := 1

#AI
var bonnieAI := 0 #TODO Automatizar por noche
var chicaAI := 30
var freddyAI := 0
var foxyAI := 0

#Position
var bonniePosition = 0
var chicaPosition = 0
var freddyPosition = 0
var foxyPosition = 0

#PosicionDeAtaque
var bonnieMaxPosition = 7
var chicaMaxPosition = 7
var freddyMaxPosition = 0
var foxyMaxPosition = null

#ActualCam
var bonnieActualCam: Node = null
var chicaActualCam: Node = null
var freddyActualCam: Node = null
#var foxyActualCam = 0

#Atacando
var bonnieIsAttacking := false
var chicaIsAttacking := false

#Puertas
var leftDoorClosed := false #TODO
var rightDoorClosed := false
