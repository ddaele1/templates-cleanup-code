; Custom Text Expander Library	
	
; Script setup	
	
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.	
#SingleInstance force	
#NoTrayIcon	
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.	
SetWorkingDir %AScriptDir%  ; Ensures a consistent starting directory.	
#Hotstring C R	

	
; Start up GUI{

::+rf::
Multiticket()
return


Multiticket(){
Gui, Destroy
Gui, add, Text,, Wat heb je nodig?
Gui, Add, Button, gMulticafe, IT tickets templates
Gui, Add, Button, gMultiCase, Casetemplate
Gui, Add, Button, gMultiSMS, Alle SMS
Gui, Add, Button, gMultimail, Mails
Gui, Add, Button, gMultiNP, NP
Gui, Add, Button, gVadeSpam, Spamcause zoeken in putty
Gui, Show
}


vadespam(){
Gui, Destroy
Gui, add, Text,,ID:
Gui, add, Edit,vid,
Gui, add, Text,,Datum(yyyymmdd):
Gui, add, Edit,vdatum,
Gui, add, Text,,Uur tijdstip(uu):
Gui, add, Edit,vtijd,
Gui, Add, Button, gCopyspam, COPY
Gui, Add, Button, gCopyspam2, COPY FOR MULTI-RECIPIENT
Gui, Add, Button, gmailvade, START SCRIPT VOOR VADE E-MAIL
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

Copyspam:
Gui, Submit, NoHide ;betere manier dan control get
stringspam =
(
zgrep id=%id% */applications-%datum%%tijd%00*
)
clipboard = %stringspam%
return

Copyspam2:

Gui, Submit, NoHide ;betere manier dan control get
stringspam2 =
(
zgrep id=%id% */messages-%datum%%tijd%00*
)
clipboard = %stringspam2%
return


; Cafe tickets GUI

Multicafe(){
Gui, Destroy
Gui, add, Text,, Alle cafe tickets:
Gui, Add, Button, gOrder, Algemeen Order issue
Gui, Add, Button, gCreation, Error / Netcracker error
Gui, Add, Button, gOvername, Error bij Overname
Gui, add, Text,, Alle Mijntelenet tickets:
Gui, Add, Button, gTelenet, Telenet / C@fe
Gui, Add, Button, gMultiticket, Ga terug

Gui, Show
}


; Cafe tickets scripts

	
; Order script

order(){
Gui, Destroy
Gui, Add, Checkbox,vcoos, COOS?
Gui, add, Text,, Problem:
Gui, Add, Edit, vorder,
Gui, add, Text,, Klantnummer:
Gui, Add, Edit, vcmr, 
Gui, add, Text,, Screen:
Gui, Add, Edit, vostat,
Gui, add, Text,, Error:
Gui, Add, Edit, verror, 
Gui, add, Text,,Steps:
Gui, Add, Edit, r10 w380 vpstat, 
Gui, add, Text,, CaseID:
Gui, Add, Edit, vcase, 
Gui, add, Text,, ProductId:
Gui, Add, Edit, vmsisdn, 
Gui, Add, Button, gCopymob, COPY
Gui, Add, Button, gcopyit, SMS
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

Copymob:
Gui, Submit, NoHide

if (coos = 1)
{ 
coos := " / COOS"
}
else
{
coos := ""
}
 
stringmob = 
(
TBOBB%coos% / %order% / %case%

- Regarding customer: %cmr% 
- Problem: %order% 
- Productid: %msisdn%
- Screen: %ostat%
- Taken steps:
  %pstat%
>>> Error appears : %error%

Can you solve this please?
Thank you!
 
Kind Regards
TBO

)
clipboard = %stringmob%
return


; Creation script

creation(){
Gui, Destroy
Gui, add, Text,, COOS?
Gui, Add, Edit, vcoos, 
Gui, add, Text,, Probleem:
Gui, Add, Edit, vorder, 
Gui, add, Text,, Klantnummer:
Gui, Add, Edit, vcmr,
Gui, add, Text,, Screen:
Gui, Add, Edit, vstat,
Gui, add, Text,, CaseID:
Gui, Add, Edit, vcase, 
Gui, add, Text,, Composite order ID:
Gui, Add, Edit, vnetcracker, 
Gui, add, Text,, Steps:
Gui, Add, Edit, r10 w380 vsteps,
Gui, add, Text,, Error:
Gui, Add, Edit, verror, 
Gui, Add, Button, gCopymob1, COPY
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

Copymob1:
Gui, Submit, NoHide

ifEqual, coos, COOS
coos = / COOS

stringmob1 = 
(
TBOBB %coos% / %order% / %case%

- Regarding customer: %cmr% 
- Problem: %order% 
- Screen: %stat%
- Composite order ID: %netcracker%
- Taken steps: 
  %steps%
>>> Error appears : %error%
- Please can you solve this? 
Thank you!
 
Kind Regards
TBO

)

clipboard = %stringmob1%
return


; Overname script

overname(){
Gui, Destroy
Gui, add, Text,, COOS?
Gui, Add, Edit, vcoos, 
Gui, add, Text,, Order status:
Gui, Add, Edit, vostat,
Gui, add, Text,,Proces + Status:
Gui, Add, Edit, vpstat, 
Gui, add, Text,, Error:
Gui, Add, Edit, verror, 
Gui, add, Text,, OUD Klantnummer:
Gui, Add, Edit, vocmr,
Gui, add, Text,, Nieuw Klantnummer:
Gui, Add, Edit, vncmr,
Gui, add, Text,, CaseID:
Gui, Add, Edit, vcase, 
Gui, add, Text,, BBA:
Gui, Add, Edit, vbba,
Gui, add, Text,, Identity:
Gui, Add, Edit, videntity,
Gui, add, Text,, Household:
Gui, Add, Edit, vHousehold,
Gui, add, Text,, TVOTT:
Gui, Add, Edit, vtvott,  
Gui, Add, Button, gCopytake, COPY
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

Copytake:
Gui, Submit, NoHide

ifEqual, coos, COOS
coos = / COOS

stringmob = 
(
TBOBBB %coos% / Data not OK after takeover / %case%

Hi,
 
Can you replace the data in NSIC?

- Old Customer number: %ocmr% 
- New Customer number: %ncmr%
- Case ID: %case% 

- BBA : %bba%
- Identity : %identity%
- Household : %household%
- TVOTT : %tvott%


Please can you solve this? 
Thank you!
 
Kind Regards
TBO

)

clipboard = %stringmob%
return


; Mijntelenet tickets script{

telenet(){
Gui, Destroy
Gui, add, Text,, COOS:
Gui, Add, Edit, vmcoos, 
Gui, add, Text,, Probleemomschrijving:
Gui, Add, Edit, vmproblem, 
Gui, add, Text,, Klantnummer:
Gui, Add, Edit, vmcmr,
Gui, add, Text,, Login:
Gui, Add, Edit, vmlogin, 
Gui, add, Text,, CASEID:
Gui, Add, Edit, vmcaseid 
Gui, add, Text,, Steps:
Gui, Add, Edit, r10 w380 vmsteps, 
Gui, add, Text,, Error:
Gui, Add, Edit, r10 w380 vmerr,
Gui, Add, Button, gCopymnp, COPY
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

Copymnp:
Gui, Submit, NoHide

ifEqual, mcoos, COOS
mcoos = / COOS


stringmnp = 
(
TBOBB %mcoos% / %mproblem% / %mcaseid%

- Customer number: %mcmr% 
- Login: %mlogin%
- Problem: %mproblem%
- Steps: 
  %msteps%
- Error message: %merr%

Please can you solve this?
Thank you!
 
Kind Regards TBO
)

clipboard = %stringmnp%
return


; general code

Close:
Gui, Destroy
Return


; SMS tickets GUI

MultiSMS(){
Gui, Destroy
Gui, add, Text,, Alle SMS:
Gui, Add, Button, gsmsalgemeen, Algemeen 
Gui, Add, Button, ginternetcafe, Internet 
Gui, Add, Button, gSMSDTV, DTV
Gui, Add, Button, gsmsTelefonie, Vaste telefoon 
Gui, Add, Button, gMultiticket, Ga terug
Gui, Show
}


; Algemeen tickets GUI

smsalgemeen(){
Gui, Destroy
Gui, add, Text,, Alle algemene sms:
Gui, Add, Button, gcallback, callback sms
Gui, Add, Button, gmodemactivate, modem geactiveerd
Gui, Add, Button, gpakketaanpassing, pakketwijziging
Gui, Add, Button, gitticket, IT ticket
Gui, Add,Button, grepaircallback, callback repair.
Gui, Add,Button, gLoginOk, Aanmelden terug ok
Gui, Add, Button, gMultiSMS, Ga terug
Gui, Show
}


; Algemeen tickets scripts


; Login OK script

LoginOK(){
Gui, Destroy
Gui, Add, Text,, Welke Service?(mijn telenet, Yelo Tv, webmail...)
Gui, Add, Edit, vService,
Gui, Add, Button, gCopyLogin, Copy
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

CopyLogin:
Gui, Submit, NoHide
stringlog =
(
Beste klant,

U kan vanf nu weer aanmelden op %Service%.

Mvg,
Telenet
)
clipboard = %stringlog%
return


; IT ticket script

itticket(){
Gui, Destroy
Gui, Add, Button, gcopyit, IT Ticket
Gui, Add, Button, gcopyitupdate, Update
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

copyit:
stringit =
(
Telenet info:
Beste klant,

We hebben je dossier doorgestuurd naar onze IT-dienst. We houden je op de hoogte. Bedankt voor uw geduld

Mvg,
Telenet
)
clipboard = %stringit%
return

copyitupdate:
stringitupdate =
(
Telenet info:
Beste klant,

Momenteel hebben we nog geen oplossing voor uw dossier. We werken eraan. Bedankt voor uw geduld

Mvg,
Telenet
)
clipboard = %stringitupdate%
return

; repaircallback script

repaircallback(){
Gui, Destroy
Gui, add, Text,, Dienst(Internet,TV,..) mag ook leeg gelaten worden:
Gui, Add, Edit, vrepdienst, 
Gui, Add, Button, grepcopycallback, COPY
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

Repcopycallback:
Gui, Submit, NoHide
stringrepcall = 
(
Beste klant,

Gelieve ons te contacteren op het nr 015/666666 voor een repair afspraak ivm uw %repdienst% diensten.

Mvg,
Telenet
)
clipboard = %stringrepcall%
return


; callback script

callback(){
Gui, Destroy
Gui, add, Text,, Caseid:
Gui, Add, Edit, vacaseid, 
Gui, Add, Button, gcopycallback, COPY
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

Copycallback:
Gui, Submit, NoHide
stringmob = 
(
Beste klant,

Kan u ons contacteren op 015/666666 in verband met uw openstaand dossier %acaseid%

Mvg,
Telenet
)
clipboard = %stringmob%
return


; modemactivate script

modemactivate(){
Gui, Destroy
Gui, add, Text,, Modemmac:
Gui, Add, Edit, vmodemmac, 
Gui, Add, Button, gcopymodemactivate, COPY
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

Copymodemactivate:
Gui, Submit, NoHide ;betere manier dan control get
stringmodem = 
(
Beste klant, 

Uw nieuwe modem %modemmac% werd geactiveerd. Binnen 30 minuten kan u gebruik maken van uw diensten

Mvg, 
Telenet

)
clipboard = %stringmodem%
return


; pakketaanpassing script

pakketaanpassing(){
Gui, Destroy
Gui, add, Text,, Welk nieuw pakket (wigo/klik/...):
Gui, Add, Edit, vpakket, 
Gui, Add, Button, gcopypakketaanpassing, COPY
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

Copypakketaanpassing:
Gui, Submit, NoHide
stringpkkt = 
(
Beste klant,
 
Uw pakket is succesvol aangepast naar %pakket%.
 
Mvg,
Telenet
)
clipboard = %stringpkkt%
return


; Internet tickets GUI

Internetcafe(){
Gui, Destroy
Gui, add, Text,, Alle internet sms:
Gui, Add, Button, greset, Wachtwoord reset
Gui, Add, Button, gemailextended, Extended email vrijgegeven
Gui, Add, Button, gemailprogramma, Verdwenen mails door mailprogramma
Gui, Add, Button, gpid, PID aangemaakt
Gui, Add, Button, gMultiSMS, Ga terug
Gui, Show
}


; Internet tickets scripts


; reset script

reset(){
Gui, Destroy
Gui, add, Text,, Wachtwoord:
Gui, Add, Edit, vwachtwoord,
Gui, Add, Button, gcopyreset, COPY
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

Copyreset:
Gui, Submit, NoHide
stringresetwachtwoord = 
(
Beste klant,

Uw nieuw wachtwoord is: %wachtwoord%

Mvg,
Telenet

)
clipboard = %stringresetwachtwoord%
return


; email extended script

emailextended(){
Gui, Destroy
Gui, add, Text,, Emailalias:
Gui, Add, Edit, vemailalias,
Gui, Add, Button, gcopyemailextended, COPY
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

Copyemailextended:
Gui, Submit, NoHide
stringemailextended = 
(
Beste klant, 

Uw alias %emailalias% is vrijgegeven. U kan deze toevoegen op uw nieuwe account.
Meer info:
https://tinyurl.com/yyrly6xc

Mvg,
Telenet
)
clipboard = %stringemailextended%
return


; email mailprogramma issue script

emailprogramma(){
Gui, Destroy
Gui, Add, Button, gcopyemailprogramma, COPY
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

Copyemailprogramma:
Gui, Submit, NoHide
stringemailprogrammas = 
(
Beste,

We kunnen geen fout vaststellen op Webmail. Gelieve de instellingen van uw mailclient te controleren. meer info:
https://tinyurl.com/y239bd2s

Telenet
)

clipboard = %stringemailprogrammas%
return


; persoonlijke login aanmaken script

pid(){
Gui, Destroy
Gui, add, Text,, Persoonlijke login aanmaken:
Gui, Add, Edit, vpersoonlijkelogin,
Gui, Add, Button, gcopypid, COPY
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

Copypid:
Gui, Submit, NoHide
stringPIDaanmaken = 
(
Beste klant,
 
Uw persoonlijke login %persoonlijkelogin% is succesvol geactiveerd.
U kan indien nodig een nieuw wachtwoord aanvragen via Mijn Telenet.
 
Mvg,
Telenet

)

clipboard = %stringPIDaanmaken%
return


; DTV tickets GUI

smsDTV(){
Gui, Destroy
Gui, add, Text,, Alle DTV sms:
Gui, Add, Button, gyeloregistratie, Alle yelo registraties verwijderen
Gui, Add, Button, gzenderpakketactivatie, zenderpakket geactiveerd
Gui, Add, Button, gMultiSMS, Ga terug
Gui, Show
}


; DTV tickets scripts


; yelo registratie script

yeloregistratie(){
Gui, Destroy
Gui, add, Text,, yeloregistratie:
Gui, Add, Edit, vyeloregistratie,
Gui, Add, Button, gcopyyeloregistratie, COPY
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

Copyyeloregistratie:
Gui, Submit, NoHide
stringyeloregistraties = 
(
Beste, 

Al uw toestellen werden ontkoppeld van yelo. U kan nu maximaal 5 toestellen registreren op yelo.
Meer info:
https://tinyurl.com/y3nacgu6

Mvg,
Telenet
)
clipboard = %stringyeloregistraties%
return


; zenderpakketactivatie script

zenderpakketactivatie(){
Gui, Destroy
Gui, add, Text,, Zenderpakket:
Gui, Add, Edit, vzenderpakket, 
Gui, Add, Button, gcopyzenderpakketactivatie, COPY
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

Copyzenderpakketactivatie:
Gui, Submit, NoHide
stringzndrpakket = 
(
Beste klant,
 
Uw zenderpakket %zenderpakket% is succesvol geactiveerd.
Dit is gebruiksklaar binnen 60 minuten
 
Mvg,
Telenet


)
clipboard = %stringzndrpakket%
return


; Telefonie tickets GUI

smsTelefonie(){
Gui, Destroy
Gui, add, Text,, Alle Telefonie sms:
Gui, Add, Button, gtelefoonactief, nieuwe telefoonlijn geactiveerd
Gui, Add, Button, gtelefoonovername, overname documenten voor vaste lijn
Gui, Add, Button, gMultiSMS, Ga terug
Gui, Show
}


; Telefonie tickets scripts
	

; telefoonactief script

telefoonactief(){
Gui, Destroy
Gui, add, Text,, Telefoonnummer:
Gui, Add, Edit, vtelefoonnummer, 
Gui, Add, Button, gcopytelefoonactief, COPY
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

Copytelefoonactief:
Gui, Submit, NoHide
stringtelefoonnr = 
(
Beste klant, 

Uw vaste lijn %telefoonnummer% is succesvol geactiveerd. U kan deze gebruiken binnen de 30 minuten.
 
Mvg,
Telenet

)
clipboard = %stringtelefoonnr%
return


; telefoonovername script

telefoonovername(){
Gui, Destroy
Gui, add, Text,, telefoonnummerov:
Gui, Add, Edit, vtelefoonnummerov, 
Gui, Add, Button, gcopytelefoonovername, COPY
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

Copytelefoonovername:
Gui, Submit, NoHide
stringtelov = 
(
Beste klant,
 
Gelieve ons overname documenten te bezorgen om de activatie van uw vaste lijn %telefoonnummerov% te kunnen voltooien.
 
Mvg,
Telenet

)
clipboard = %stringtelov%
return


; case template GUI

MultiCase(){
Gui, Destroy
Gui, add, Text,, Case template
Gui, Add, Button, gcasetemplate, Case template
Gui, Add, Button, gcasetvapptemplate, Template info tv-app issue.
Gui, add, Text,, Subcase templates:
Gui, Add, Button, gsubinternational, Internationale oproepen
Gui, Add, Button, gsubdtv, Subcase dtv
Gui, Add, Button, gMultiticket, Ga terug
Gui, Show
}


; Subcase Templates


;case template

casetvapptemplate(){
Gui, Destroy
Gui, add, Text,, Template voor een TV App case met onvoldoende info.
Gui, Add, Button, gCopyTvAppTemplate, COPY
Gui, Add, Button, gClose, CLOSE
Gui, Add, Button, gMultiCase, Ga terug
Gui, Show
}

CopyTvAppTemplate:
stringTvAppTemplate = 
(
Volgende gegevens dienen zeker vermeld te worden in de case:

Tijdstip: (uur, datum)
Toestelinfo: (vb. Samsung A3 met Android 6.0)
Welk programma of welke zender?: (vb. Thuis Sz. 24 Ep. 4562)
Errorcode: (vb. SM 1035 / SM 1036 / geen /…)
Welke PID gebruikt: (test@telenet.be)
Korte omschrijving van het probleem: (vb. geen beeld, slecht beeld, constante storingen, stream start niet op …)
)
clipboard = %stringTvAppTemplate%
return


;case template

casetemplate(){
Gui, Destroy
Gui, Font, s12
Gui, add, Text,, Technical issue
Gui, Add, Edit, r10 w380 vTissue, 
Gui, add, Text,, Steps taken :
Gui, Add, Edit, r10 w380 vStaken,
Gui, add, Text,, Conclusion : 
Gui, Add, Edit, r10 w380 vConclusionCase, 
Gui, Add, Button, gCopyCaseTemplate, COPY
Gui, Add, Button, gClear, CLEAR
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

Clear:
GuiControl, ,Tissue
GuiControl, ,Staken
GuiControl, ,ConclusionCase
Return


CopyCaseTemplate:
Gui, Submit, NoHide

stringCaseTemplate = 
(
Technical issue : 
%Tissue%

Steps taken :  
%Staken%

Conclusion / communication :
%ConclusionCase% 
)
clipboard = %stringCaseTemplate%
return


; sub case internalional script

subinternational(){
Gui, Destroy
Gui, add, Text,, Country?
Gui, Add, Edit, vcountry, 
Gui, add, Text,, Voorbeeld nummer 1
Gui, Add, Edit, vvoorbeeldnr1,
Gui, add, Text,, Voorbeeld nummer 2
Gui, Add, Edit, vvoorbeeldnr2, 
Gui, add, Text,, Voorbeeld nummer 3
Gui, Add, Edit, vvoorbeeldnr3,
Gui, add, Text,, Datum + uur (niet ouder dan 2 dagen)
Gui, Add, Edit, vdateintersub, 
Gui, add, Text,, Message heard by customer: (fast busy tone/ silence / one way speech / message?)
Gui, Add, Edit, vmessagesubinter, 
Gui, add, Text,, Telenet Fix (015/666666): OK/NOK
Gui, Add, Edit, vtelfixsubinter, 
Gui, add, Text,, Proximus Fix (015/295011): OK/NOK
Gui, Add, Edit, vtelproxsubinter, 
Gui, add, Text,, Vul aan indien meer testen werden gedaan
Gui, Add, Edit, r10 w380 vextrasubinter
Gui, Add, Button, gsubinternational, CLEAR
Gui, Add, Button, gCopyinternalsub, COPY
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

Copyinternalsub:
Gui, Submit, NoHide

stringinternalsub = 
(
Customer cannot make calls to %country%.

Examples:
%voorbeeldnr1%
%voorbeeldnr2%
%voorbeeldnr3%
Date + hour: %dateintersub%
Message heard by customer: (fast busy tone/ silence / one way speech / message?)
%messagesubinter%

TBO also did testcalls:
	
Telenet Fix (015/666666): %telfixsubinter%
Proximus Fix (015/295011):%telproxsubinter%


(vul aan indien meer testen werden gedaan)
%extrasubinter%
Can you please check?

)
clipboard = %stringinternalsub%
return


; subcase dtv

subdtv(){
Gui, Destroy
Gui, add, Text,, Probleem?
Gui, Add, Edit, vsubdtvsummary, 
Gui, add, Text,, probleembeschrijving
Gui, Add, Edit, vsubdtvsummary1,
Gui, add, Text,, Platform: EOS, HznGo360(TelenetTV), Sipadan, Yelo, Yugo, Tadaam, PSGo/web
Gui, Add, Edit, vsubdtvplatform, 
Gui, add, Text,, Impacted asset(s)/ channel(s): (vtm, Live, Replay, Recording, VoD)
Gui, Add, Edit, vsubdtvassets,
Gui, add, Text,, Devices impacted
Gui, add, Text,, STB, iOS, Android, Web, Chromecast (streaming via iOS/Android) Chromecast build into TV, AndroidTV, casting using Airplay, AppleTV, MIBox, Tizen, etc
Gui, Add, Edit, vsubdtvdevices, 
Gui, add, Text,, Device info: eg: Philips 55PUS9435/12 Smart TV with build-in Chromecast
Gui, Add, Edit, vsubdtvdeviceinfo, 
Gui, add, Text,, Location of occurrence
Gui, add, Text,, area of occurrence: individual, regional, national or regional, other modem/4G/other ISP)  etc.
Gui, Add, Edit, vsubdtvlocation, 
Gui, add, Text,, Times issue occurred: any available timestamps of occurrences 
Gui, Add, Edit, vsubdtvtimesocc, 
Gui, add, Text,, Logging data if available using available tools: Yelo admintool, TUP, LDAP 
Gui, Add, Edit, r9 w380 vsubdtvlogging,
Gui, add, Text,, Reproducible every time or sometimes: If it is reproducible, description on how this is reproduced
Gui, Add, Edit, r9 w380 vsubdtvrepoducible,
Gui, add, Text,, Screenshots, video recordings of issue if possible
Gui, Add, Edit, vsubdtvscreenshot,
Gui, add, Text,, Individual Customer data: customer ids, STB IDs (sw version), username, product of customer, DTV-line
Gui, add, Edit, r9 w380 vsubdtvcustomerdata,
Gui, Add, Button, gsubdtv, CLEAR
Gui, Add, Button, gCopysubdtvalgeem, COPY
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

Copysubdtvalgeem:
Gui, Submit, NoHide


stringsubdtvalgeem = 
(
Summary: 
%subdtvsummary%
Notes: 
%subdtvsummary1%
Platform: 
%subdtvplatform%	
Impacted Asset(s)/channel(s): 
%subdtvassets% 
Devices impacted: 
%subdtvdevices%
Device info: 
%subdtvdeviceinfo%	
Location of occurrence	area of occurrence:  
%subdtvlocation%
Times issue occurred: 
%subdtvtimesocc%
Logging data if available using available tools: 
%subdtvlogging%
Reproducible every time or sometimes: 
%subdtvrepoducible%
Screenshots, video recordings of issue if possible: 
%subdtvscreenshot%
Individual Customer data: 
%subdtvcustomerdata%
)
clipboard = %stringsubdtvalgeem%
return


; NP GUI

MultiNP(){
Gui, Destroy
Gui, add, Text,, Alle NP Templates:
Gui, Add, Button, gRejectgrouping, template reject owv grouping 
Gui, Add, Button, gRejectadrescheck, template reject owv adrescheck
Gui, add, Text,, duedate templates.
Gui, Add, Button, gDuedatenew, template voor due date cases new
Gui, Add, Button, gDuedateaccept, template voor order status npr/ accept
Gui, Add, Button, gDuedateexec, template voor np opstarten exec verzonden
Gui, add, Text,, LOA mail
Gui, Add, Button, gLOANL, Letter of agreement NL
Gui, Add, Button, gLOAFR, Letter of agreement FR
Gui, Add, Button, gMultiticket, Ga terug
Gui, Show
}


; NP template


; Rejectgrouping

Rejectgrouping(){
Gui, Destroy
Gui, add, Text,, Nummer1
Gui, Add, Edit, vNummer1,
Gui, add, Text,, Nummer2
Gui, Add, Edit, vNummer2,
Gui, Add, Button, gCopyRejectNP, COPY
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

CopyRejectNP:
Gui, Submit, NoHide

stringRejectNP =
(

We hebben een weigering ontvangen van Proximus voor het porteren van nummer : %Nummer1%.

Reden van reject (weigering) : Onvolledige reeks.




Klant heeft bij Proximus niet enkel het nummer %Nummer1% (nummer A) actief staan maar ook het nummer : %Nummer2% (nummer B).

MAAR ... Wat moet er gebeuren met het nummer (nummer B) : %Nummer2%? 




1. Mee naar Telenet? >>> Inboeken in Cafe. Laten weten of afwerken install nodig is of niet.

2. Opzeggen bij Proximus? >>> Log info in de case. TBO doet nieuwe aanvraag.

3. Actief houden bij Proximus? >>> Log info in de case. TBO doet nieuwe aanvraag.

 

Let op! Je mag de nummer niet inboeken om achteraf op te zeggen!!! Dit geeft problemen voor in de toekomst.


)
clipboard = %stringRejectNP%
return


; Rejectadrescheck

Rejectadrescheck(){
Gui, Destroy
Gui, add, Text,, Telefoonnummer
Gui, Add, Edit, vTelefoonnummeradres,
Gui, add, Text,, naam van de klant Proximus
Gui, Add, Edit, vnaamadres1,
Gui, add, Text,, Adres Proximus
Gui, Add, Edit, vAdres1,
Gui, add, Text,, naam van de klant Telenet
Gui, Add, Edit, vnaamadres2,
Gui, add, Text,, Adres Telenet
Gui, Add, Edit, vAdres2
Gui, Add, Button, gCopyRejectadres, COPY
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

CopyRejectadres:
Gui, Submit, NoHide

stringRejectadres =
(

Klant meermaals proberen te bereiken ivm nummerportering : Telefoonnummer : %Telefoonnummeradres%

Indien de klant binnen belt, dient er een controle te gebeuren van naam + adres!!!

Voor de nummerportering te kunnen voltooien, hebben wij onderstaande gegevens nodig van de klant :

 

Gegevens bij Proximus :
Naam : %naamadres1%
Adres : %Adres1%

 

Gegevens bij ons :
Naam : %naamadres2%
Adres : %Adres2%

 

!!! Vraag aan klant --> Kent onze klant bovenstaande klant? (gegevens van Proximus)

Bijvoorbeeld:
Dit kan de echtgenote zijn
Heeft de klant eventueel een verhuis gehad?

 

Gelieve dit zeker na te vragen aan de klant! Zonder deze info zal de nummerportering niet kunnen verder gezet worden.

Heb je de case geaccepteerd? Geen nood! Je mag de case opnieuw dispatchen naar : TBO FNP ACK !!!

Indien we nog steeds geen duidelijk info hierover ontvangen, zullen wij de klant een nieuw nummer geven + hiervan op de hoogte brengen per brief.

 

Wij proberen de klant opnieuw te contacteren op (datum). Indien we de klant nog steeds niet kunnen bereiken, zullen wij de klant een nieuw nummer geven + hiervan op de hoogte brengen per mail.



)
clipboard = %stringRejectadres%
return


; Duedatenew

Duedatenew(){
Gui, Destroy
Gui, add, Text,, Telefoonnummer
Gui, Add, Edit, vTelefoonnummerddnew,
Gui, add, Text,, due date
Gui, Add, Edit, vDuedatenew,
Gui, Add, Button, gCopyddnew, COPY
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

Copyddnew:
Gui, Submit, NoHide

stringddnew =
(

De nummerportering van het nummer %Telefoonnummerddnew% staat momenteel nog open.

Status order = NEW

Nummerportering opnieuw opgestart via dummy technieker door TBO

Nadien is de status van het NP order = NPR SENT

Due Date = %Duedatenew%

=> Dit is de opstartdatum van de nummeroverdracht. (indien we een accept ontvangen)

=> PAS VANAF DEZE DATUM ZAL DE KLANT BEREIKBAAR ZIJN VOOR ALLE OPERATOREN OP DE AANSLUITING VAN TELENET!




)
clipboard = %stringddnew%
return


; Duedateaccept

Duedateaccept(){
Gui, Destroy
Gui, add, Text,, Telefoonnummer
Gui, Add, Edit, vTelefoonnummerddaccept,
Gui, add, Text,, np status
Gui, Add, Edit, vnpstatusaccept
Gui, add, Text,, due date
Gui, Add, Edit, vDuedateaccept,
Gui, Add, Button, gCopyddaccept, COPY
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

Copyddaccept:
Gui, Submit, NoHide

stringddaccept =
(

De nummerportering van het nummer %Telefoonnummerddaccept% staat momenteel nog open.

Status order = %npstatusaccept%

Due Date = %Duedateaccept%

=> Dit is de opstartdatum van de nummeroverdracht. (indien we een accept ontvangen)

=> PAS VANAF DEZE DATUM ZAL DE KLANT BEREIKBAAR ZIJN VOOR ALLE OPERATOREN OP DE AANSLUITING VAN TELENET!


)
clipboard = %stringddaccept%
return


; Duedateexec

Duedateexec(){
Gui, Destroy
Gui, Add, Button, gCopyddexec, COPY
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

Copyddexec:

stringddexec =
(

Exec verzonden, hierdoor wordt de nummerportering naar Telenet opgestart.

Van zodra de status op RFS sent staat, is de nummerportering volledig afgehandeld.

=> PAS VANAF DAN ZAL DE KLANT BEREIKBAAR ZIJN VOOR ALLE OPERATOREN OP DE AANSLUITING VAN TELENET!



)
clipboard = %stringddexec%
return

; LOANL

LOANL(){
CheckOutlook()
Inputbox, Telefoonnummer, Telefoonnummer
Inputbox, naam, jouw naam

subloa = Nummeroverdracht___ %Telefoonnummer%___Letter of agreement
t1LOA1 = 
(
<p>Beste mevrouw, mijnheer,</p>
<p>&nbsp;</p>
<p>U nam contact met ons op omdat u graag gebruik zou maken van de diensten van Telenet.</p>
<p>&nbsp;</p>
<p>Bij het nakijken van uw contract zijn wij tot de vaststelling gekomen dat de aanvraag van&nbsp;het nummer dat u ons doorgaf, %Telefoonnummer%, werd geweigerd door %Telefoonnummer%. Om de nummer overdracht te kunnen voltooien dient u ons het document in bijlage, ingevuld terug te bezorgen.</p>
<p>Als dit niet uw nummer is, vragen wij u zo snel mogelijk contact met ons op te nemen op het nummer 015 66 66 66.</p>
<p>&nbsp;</p>
<p>Wij hopen dat wij u hiermee voldoende informatie hebben gegeven.</p>
<p>&nbsp;</p>
<p>Hebt u nog vragen? Neem alvast een kijkje op <a class="external-link" href="http://www.telenet.be/klantenservice" rel="nofollow">www.telenet.be/klantenservice</a>.</p>
<p>U kunt er 24 uur op 24 informatie opzoeken of contact met ons opnemen via een webformulier op <a class="external-link" href="http://www.contact.telenet.be/" rel="nofollow">www.contact.telenet.be</a>.</p>
<p>&nbsp;</p>
<p>Met vriendelijke groeten,</p>
<p>&nbsp;</p>
<p>%naam%</p>
<p>Telenet Klantendienst</p>
</div>


)
MailFromTest(subloa, t1LOA1, "technischehulp@telenetgroup.be", "", "technischehulp@telenetgroup.be")
}


; LOAFR

LOAFR(){
CheckOutlook()
Inputbox, Telefoonnummer1, Telefoonnummer
Inputbox, naam1, jouw naam

subloa2 = portage du num&eacute;ro___ %Telefoonnummer1%___Letter of agreement
t1LOA2 = 
(
<p>Ch&egrave;re Madame, Monsieur,</p>
<p>&nbsp;</p>
<p>Vous avez pris contact avec nous car vous souhaitez utiliser les services de telenet.</p>
<p>&nbsp;</p>
<p>En examinant votre contrat, nous avons constat&eacute;s que la demande pour le num&eacute;ro que vous avez communiqu&eacute;,%Telefoonnummer1%, a &eacute;t&eacute; refus&eacute;e par %Telefoonnummer1%. Afin de compl&eacute;ter la portabilit&eacute; de num&eacute;ro, merci de remplir le document en annexe et de le nous retourner.</p>
<p>&nbsp;</p>
<p>Si ceci n&rsquo;est pas votre num&eacute;ro, nous vous demandons de nous contacter au plus vite possible au 015 66 66 66.</p>
<p>&nbsp;</p>
<p>Nous esp&eacute;rons de vous avoir fourni tous les informations n&eacute;cessaires.</p>
<p>&nbsp;</p>
<p>Encore des questions ? Nous vous invitons de visiter <a class="external-link" href="https://www2.telenet.be/fr/serviceclient" rel="nofollow">https://www2.telenet.be/fr/serviceclient</a></p>
<p>&nbsp;</p>
<p>Vous y trouverez des renseignement 24 heures sur 24. Alternativement, vous pouvez nous contacter utilisant le formulaire web sur <a class="external-link" href="http://www.contact.telenet.be/" rel="nofollow">www.contact.telenet.be</a>.</p>
<p>&nbsp;</p>
<p>Bien &agrave; vous,</p>
<p>&nbsp;</p>
<p>%naam1%</p>
<p>Service Client Telenet</p>


)
MailFromTest(subloa2, t1LOA2, "technischehulp@telenetgroup.be", "", "technischehulp@telenetgroup.be")
}


; Mails GUI

Multimail(){
Gui, Destroy
Gui, add, Text,, Algemeen
Gui, Add, Button, gT1Viol, voorbeeld mails
Gui, Add, Button, gOLO, lege olo mail
Gui, Add, Button, gOLOPX, olo mail proximus
Gui, Add, Button, gmailvade, mail template voor vade secure
Gui, Add, Button, gIMmail, melding mail IM
Gui, Add, Button, gMultiticket, Ga terug
Gui, Show
}


; Mail Shortcuts scripts 

T1Viol:
T1violation()
return


; Mail full scripts 


; T1 violation

T1violation(){
CheckOutlook()
Inputbox, klantengegevens, klantennaam + klantennummer
Inputbox,caseid, Caseid
Inputbox, probleem, probleem van de klant

subt1 = %klantengegevens% / %probleem% / %caseid%
t1viol = 
(
<p>Beste,</p>
<p>&nbsp;</p>
<p>Naar aanleiding van uw dossier %caseid% aangaande %probleem% .</p>
<p>Is het mogelijk om ons voorbeelden te bezorgen:</p>
<p>Verzender/ ontvanger / dag en tijdstip</p>
<p>Alvast bedankt voor uw tijd en medewerking.</p>
<p>Je kan antwoorden op deze mail met de voorbeelden, mag ik u vragen om het onderwerp van de mail niet te wijzigen.</p>
<p>&nbsp;</p>
<p>Mvg</p>


)
MailFromTest(subt1, t1viol, "technischehulp@telenetgroup.be", "", "technischehulp@telenetgroup.be")
}


; OLO

OLO(){
CheckOutlook()
Inputbox, TelefoonnummerOLO, Telefoonnummer, 
Inputbox, provider, provider
Inputbox, caseolo, caseid
Inputbox, naamolo, jouw naam

subolo1 = %TelefoonnummerOLO%___Niet bereikbaar voor %provider%___%caseolo%
t1olo = 
(
<p>Beste,</p>
<p>Het nummer %TelefoonnummerOLO% is niet bereikbaar voor %provider% abonnees.</p>
<p>Kunnen jullie de routering nakijken?</p>
<p>&nbsp;</p>
<p>MVG</p>
<p>%naamolo%</p>


)
MailFromTest(subolo1, t1olo, "Telenet_NP@telenetgroup.be", "", "Telenet_NP@telenetgroup.be")
}

	
; OLOPX

OLOPX(){
CheckOutlook()
Inputbox, TelefoonnummerOLPX, Telefoonnummer
Inputbox, caseolopx, caseid
Inputbox, naamolopx, jouw naam

subolopx = %TelefoonnummerOLPX%___Niet bereikbaar voor Proximus___%caseolopx%
t1olopx = 
(
<p>Beste,</p>
<p>Het nummer %TelefoonnummerOLPX% is niet bereikbaar voor Proximus abonnees.</p>
<p>Kunnen jullie de routering nakijken?</p>
<p>&nbsp;</p>
<p>MVG</p>
<p>%naamolopx%</p>


)
MailFromTest(subolopx, t1olopx, "Telenet_NP@telenetgroup.be", "car_np@proximus.com", "Telenet_NP@telenetgroup.be")
}


; mailvade

mailvade(){
CheckOutlook()
Inputbox, emailvade, email, Het e-mail adres of het domein waar het over gaat?
Inputbox, naamvade, jouw naam, Uw naam?
Inputbox, afzender,E-mail zender, E-mail adres afzender in het voorbeeld?
Inputbox, ontvanger, E-mail ontvanger, E-mail adres bestemmeling in het voorbeeld?
Inputbox, dateandtime, datum, Datum en tijdstip van het voorbeeld?
Inputbox, spamcause, spamcause, Spamcause van het voorbeeld?


subolopx = mails sent from  %emailvade% are incorrectly marked as spam
t1olopx = 
(
<p>Hi</p>

<p>Mails sent from the domain/e-mail %emailvade% are incorrectly marked as spam. Can you please check and correct this</p>

<p>Example:</p>

<p>Sender: %afzender%<br>
Recipient: %ontvanger%<br>
Date: %dateandtime%<br>
Spam cause: %spamcause%</p>

<p>Decrypted:<br>
!!!Plak hier de decrypted spamcause!!!</p>

<p>With kind regards<br>
%naamvade%</p>
)
MailFromTest(subolopx, t1olopx, "", "support@vadesecure.com", "")
}


; IMmail

IMmail(){
Gui, Destroy
Gui, add, Text,, Problem description
Gui, Add, Edit, vimmailproblemdescription, 
Gui, add, Text,, customer/ user impact
Gui, Add, Edit, vimmailcimpact,
Gui, add, Text,, inflow
Gui, Add, Edit, vimmailinflow,
Gui, add, Text,, frequency
Gui, Add, Edit, vimmailfrequency, 
Gui, add, Text,, workaround Y/N
Gui, Add, Edit, vimmailworkaround, 
Gui, add, Text,, reproducable / tests
Gui, Add, Edit, r5 w380 vimmailreproducable, 
Gui, add, Text,, Example 1
Gui, Add, Edit, r2 w380 vimmailexamples2, 
Gui, add, Text,, Example 2
Gui, Add, Edit, r2 w380 vimmailexamples3, 
Gui, add, Text,, Example 3
Gui, Add, Edit, r2 w380 vimmailexamples, 
Gui, add, Text,, Je eigen naam
Gui, Add, Edit, vimmailnaam, 
Gui, Add, Button, gCopyimmail1, GENERATE MAIL
Gui, Add, Button, gClose, CLOSE
Gui, Show
}

Copyimmail1:
GuiControlGet, immailproblemdescription
GuiControlGet, immailcimpact
GuiControlGet, immailinflow
GuiControlGet, immailfrequency
GuiControlGet, immailworkaround
GuiControlGet, immailreproducable
GuiControlGet, immailexamples
GuiControlGet, immailexamples2
GuiControlGet, immailexamples3
GuiControlGet, immailnaam
GenerateImmail(immailproblemdescription, immailcimpact, immailinflow, immailfrequency, immailworkaround, immailreproducable, immailexamples,immailexamples2, immailexamples3, immailnaam)
return

GenerateImmail(immailproblemdescription, immailcimpact, immailinflow, immailfrequency, immailworkaround, immailreproducable, immailexamples,immailexamples2, immailexamples3, immailnaam)
{
CheckOutlook()
subimmail2 = IM/  %immailproblemdescription%/ %immailcimpact%
rbodimail1 = 
(
<p>Hi,</p>
<p><strong>Problem description</strong>: %immailproblemdescription%</p>
<p><strong>Customer / user impact</strong>: %immailcimpact%</p>
<p><strong>Inflow #</strong>: %immailinflow%</p>
<p><strong>Frequency</strong>: %immailfrequency%</p>
<p><strong>Workaround Y/N</strong>: %immailworkaround%</p>
<p><strong>Reproducable / tests</strong>: %immailreproducable%</p>
<p><strong>Examples</strong>: </p>
<p>- %immailexamples% </p>
<p>- %immailexamples2% </p>
<p>- %immailexamples3% </p>

<p>Kr</p>

<p>%immailnaam%</p>

)
MailFromTest(subimmail2, rbodimail1 ,"D_Broadband.Services@telenetgroup.be", "TBOincidentmanagement@telenetgroup.be", "")
}


; Run Outlook script
	; MAILS 

CheckOutlook(){
Process, Exist, Outlook.exe
If Not ErrorLevel
{
	Run, Outlook.exe	; You may need to specify the full path here.
	WinWaitActive, ahk_exe Outlook.exe
	sleep 2000
	Msgbox, Wacht tot als Outlook is opgestart
}
}

MailTest(msubj, mbod, ccm){
MailToTest(msubj, mbod, ccm, "")
}

MailFromTest(mailsubject, mailbody, ccmail, tomail, frommail){


sender := "Telenetmobile@telenetgroup.be"
olMailItem := 0
MailItem := ComObjActive("Outlook.Application").CreateItem(olMailItem)
MailItem.BodyFormat := 2 ; olFormatHTML
MailItem.SentOnBehalfOfName := frommail
MailItem.TO := tomail
MailItem.CC := ccmail
MailItem.Subject := mailsubject
MailItem.HTMLBody := mailbody
MailItem.Display
run, %A_ScriptFullPath%
}

MailFromTestNoRun(mailsubject, mailbody, ccmail, tomail, frommail){

sender := "Telenetmobile@telenetgroup.be"
olMailItem := 0
MailItem := ComObjActive("Outlook.Application").CreateItem(olMailItem)
MailItem.BodyFormat := 2 ; olFormatHTML
MailItem.SentOnBehalfOfName := frommail
MailItem.TO := tomail
MailItem.CC := ccmail
MailItem.Subject := mailsubject
MailItem.HTMLBody := mailbody
MailItem.Display
}

MailToTest(mailsubject, mailbody, ccmail, tomail) {

sender := "Telenetmobile@telenetgroup.be"
olMailItem := 0
o:= ComObjActive("Outlook.Application").Session()
MailItem := ComObjActive("Outlook.Application").CreateItem(olMailItem)
MailItem.BodyFormat := 2 ; olFormatHTML
MailItem.TO := tomail
MailItem.CC := ccmail
;~ MailItem.Replyto :=""

MailItem.Subject := mailsubject
 
;***********html body of Outlook email******************* 
MailItem.HTMLBody := mailbody

;****************************** 

MailItem.Display ;Make email visible
run, %A_ScriptFullPath%
}
	

; Datum 2 dagen verder
DateFurther()
{
TodayName=%A_DDDD%

IfEqual,TodayName,donderdag
{
         AddMe=4
}
Else IfEqual,TodayName,Thursday
{
         AddMe=4
}
Else IfEqual,TodayName,vrijdag
{
         AddMe=4
}
Else IfEqual,TodayName,Friday
{
         AddMe=4
}
Else IfEqual,TodayName,zaterdag
{
         AddMe=4
}
Else IfEqual,TodayName,Saturday
{
         AddMe=3
}
Else
{
         AddMe=2
}
Date := A_Now 
Date += %AddMe%, Days
FormatTime, nDate, %Date%, yyMMdd
return %nDate%
}	


; providercheck 

	CheckPBProvider(checkcase){

if checkcase = 
{
providercheck := " "
return providercheck
}

IfInString, checkcase, C
{
providercheck = TelenetMNP@telenetgroup.be
return providercheck
}
else
{
providercheck = mnp-operator@telenetgroup.be
return providercheck
}
}CheckRProvider(checkcase){

if checkcase = 
{
providercheck := " "
return providercheck
}

IfInString, checkcase, C
{
providercheck = Telenetmobile@telenetgroup.be
return providercheck
}
else
{
providercheck = bo.services.and.network.support@telenetgroup.be
return providercheck
}
}


; 04 to 324 
	^;::
c = %clipboard%

if c < 0499999999
 c := c + 3200000000
else
{
  c := c - 32000000000
  c = 0%c%
}
clipboard = %c%
return	


; Date 7 dagen 
	
	Date7()
{

Dates := A_Now 
Dates += 7, Days
FormatTime, TodayNames, %Dates%, dddd

IfEqual,TodayNames,zaterdag
{
         AddMes=2
}
Else IfEqual,TodayNames,zondag
{
         AddMes=1
}

Dates += %AddMes%, Days
FormatTime, nDates, %Dates%, yyMMdd
return %nDates%
}

DateNow() 
{
Date := A_Now 
FormatTime, nDate, %Date%, yyMMdd
return %nDate%
}

DatumEnTijd() 
{
Date := A_Now 
FormatTime, nDate, %Date%, dd-MM-yyyy HH:mm 
return %nDate%
}


; HOTKEY INFO {
shortcuts(){
SplashTextOn, 500, 500, info, CHROME `nSHIFT + F1  Open nieuw chrome TAB `nSHIFT + F2  Open PEGA in CHROME `nSHIFT + F3  Open Netcracker in CHROME `nSHIFT + F4  Open NINAS in CHROME `nSHIFT + F5  Open Voiceweb in CHROME `nSHIFT + F6  Open Remedyforce in CHROME `nSHIFT + F7  Open CCI Telenet in CHROME `nSHIFT + F8  Open CCI BASE in CHROME `nSHIFT + F9  Open MSPS in CHROME `nSHIFT + F10 Open CRDC in CHROME `nDefault browser `nCTRL + F1  Niet gelinked `nCTRL + F2  Open Cafe in default browser (IE of Edge) `nCTRL + F3  Open MNPMAN in default browser (IE of Edge) `nCTRL + F4  Open CRDC in default browser (IE of Edge) `nCTRL + F5  Niet in gebruik `nCTRL + F6  Open Voiceweb in default browser (IE of Edge) `nCTRL + F7  Open DINOMAN EN KAPSCH in default browser (IE of Edge) `nCTRL + F8  Open EPNY in default browser (IE of Edge) `nCTRL + F9  Open GIS in default browser (IE of Edge) `nCTRL + F10 Open MXPD in default browser (IE of Edge) `nCTRL + F11 Open Remedyforce in default browser (IE of Edge) `nCTRL + F12 Open GENESYS in default browser (IE of Edge)
WinMove, info, , 250, 250  ; Move the splash window to the top left corner.
MsgBox, Press OK to close the info popup
SplashTextOff
}