Class {
	#name : #FrenchVerbsTutor,
	#superclass : #GtLlmTutor,
	#category : #FrenchVerbs
}

{ #category : #'as yet unclassified' }
FrenchVerbsTutor >> defaultDescription [
	^ 'You are an assistant that is used to interactively work on blog posts.'
]

{ #category : #'as yet unclassified' }
FrenchVerbsTutor >> defaultProviderStencil [
	^ [:aValue | (super defaultProviderStencil value: aValue) assistantMessageClass: FrenchVerbsMessage; userMessageClass: FrenchVerbsMessage ]
]

{ #category : #'as yet unclassified' }
FrenchVerbsTutor >> gtListFormatDescription [
	<gtLlmTutorFormat>
	^ GtLlmTutorFormatDescription new
	type: 'string';
	format: 'Text';
	name: 'List';
	priority: 10;
	example: nil
]

{ #category : #'as yet unclassified' }
FrenchVerbsTutor >> gtPresentTenseConjugation [
 	<gtLlmTutorAction>
 	^ GtLlmTutorAction new
	    name: 'Present tense conjugation';
	    priority: 10;
		description: 'Chat: Please produce the conjugation at present tense in French for the verbs. For each verb list the conjugation and format the result in a plain text list comma separated list that also includes the initial verb on the first position. The row should not contain any other information outside of the verb at the infinitive and the conjugations. Do not include the pronoun. Return the result in the `List` property.';
		examples: {GtLlmTutorActionExample new
	input: { 'List' -> 'avoir
être
adorer
acheter
admirer
aimer
aller
attendre
battre
boire
chanter
commencer
connaître
construire
décider
descendre
détester
devoir
dire
donner
dormir
écrire
entendre
enfermer
enregistrer
entrer
espérer
explorer
faire
frapper
gagner
goûter
habiter
hacher
inviter
jouer
laver
lire
manger
mélanger
mettre
monter
montrer
nettoyer
opérer
parler
passer
(ap)prendre
comprendre
surprendre
partir
penser
préférer
publier
pouvoir
raconter
regarder
rencontrer
rentrer
réparer
répondre
réserver
retourner
rêver
savoir
sentir
servir
sortir
sourire
tomber
toucher
traverser
trier
trouver
vendre
venir
vivre
voir
vouloir s’amuser
s’appeler
s’énerver
s’habiller
se coucher
se dépêcher
se doucher
se laver
se lever
se préparer
se présenter
se réveiller'. 'Action' -> 'Present tense conjugation' } asDictionary;
	output: { 'List' -> 'avoir,ai,as,a,avons,avez,ont
être,suis,es,est,sommes,êtes,sont
adorer,adore,adores,adore,adorons,adorez,adorent
acheter,achète,achètes,achète,achetons,achetez,achètent
admirer,admire,admires,admire,admirons,admirez,admirent
aimer,aime,aimes,aime,aimons,aimez,aiment
aller,vais,vas,va,allons,allez,vont
attendre,attends,attends,attend,attendons,attendez,attendent
battre,bats,bats,bat,battons,battez,battent
boire,bois,bois,boit,buvons,buvez,boivent
chanter,chante,chantes,chante,chantons,chantez,chantent
commencer,commence,commences,commence,commençons,commencez,commencent
connaître,connais,connais,connaît,connaissons,connaissez,connaissent
construire,construis,construis,construit,construisons,construisez,construisent
décider,décide,décides,décide,décidons,décidez,décident
descendre,descends,descends,descend,descendons,descendez,descendent
détester,déteste,détestes,déteste,détestons,détestez,détestent
devoir,dois,dois,doit,devons,devez,doivent
dire,dis,dis,dit,disons,dites,disent
donner,donne,donnes,donne,donnons,donnez,donnent
dormir,dors,dors,dort,dormons,dormez,dorment
écrire,écris,écris,écrit,écrivons,écrivez,écrivent
entendre,entends,entends,entend,entendons,entendez,entendent
enfermer,enferme,enfermes,enferme,enfermons,enfermez,enferment
enregistrer,enregistre,enregistres,enregistre,enregistrons,enregistrez,enregistrent
entrer,entre,entres,entre,entrons,entrez,entrent
espérer,espère,espères,espère,espérons,espérez,espèrent
explorer,explore,explores,explore,explorons,explorez,explorent
faire,fais,fais,fait,faisons,faites,font
frapper,frappe,frappes,frappe,frappons,frappez,frappent
gagner,gagne,gagnes,gagne,gagnons,gagnez,gagnent
goûter,goûte,goûtes,goûte,goûtons,goûtez,goûtent
habiter,habite,habites,habite,habitions,habitez,habitent
hacher,hache,haches,hache,hachons,hachez,hachent
inviter,invite,invites,invite,invitions,invitez,inviten
jouer,joue,joues,joue,jouons,jouez,jouent
laver,lave,laves,lave,lavons,lavez,lavent
lire,lies,lies,lit,lisons,lisez,lisent
manger,mange,manges,mange,mangeons,mangez,mangent
mélanger,mélange,mélanges,mélange,mélangeons,mélangez,mélangent
mettre,met,met,met,mettons,mettez,mettent
monter,monte,montes,monte,montrons,montez,montent
montrer,montrer,montrers,montrer,montrons,montray,montrent
nettoyer,nettoie,nettoies,nettoie,nettoyons,nettoyez,nettoient
opérer,opère,opères,opère,opérons,opérez,opèrent
parler,parle,parles,parle,parlons,parlez,parlent
passer,passe,passes,passe,passons,passez,passent
(ap)prendre,prends,prends,prend,prenons,prenez,prennent
comprendre,comprends,comprends,comprend,comprenons,comprenez,comprennent
surprendre,surprends,surprends,surprend,surprenons,surprenez,surprennent
partir,pars,pars,part,partons,partez,partent
penser,pense,penses,pense,pensons,pensez,pensent
préférer,préfère,préfères,préfère,préférons,préférez,préfèrent
publier,publie,publies,publie,publions,publiez,publient
pouvoir,peux,peux,peut,pouvons,pouvez,peuvent
raconter,raconte,racontes,raconte,racontons, racontez,racontent
regarder,regarde,regardes,regarde,regardons,regardez,regardent
rencontrer,rencontre,rencontres,rencontre,rencontrons,rencontrez,rencontrent
rentrer,rentre,rentres,rentre,rentrons,rentrez,rentrent
réparer,répare,répares,répare,réparons,réparez,réparent
répondre,réponds,réponds,répond,répondons,répondez,répondent
réserver,résèrve,résèrves,résèrve,résèrverons,résèrverez,résèrvent
retourner,retourne,retournes,retourne,retournons,retournez,retournent
rêver,rêve,rêves,rêve,rêvons,rêvez,rêvent
savoir,sais,sais,sait,savons,savez,savent
sentir,sens,sens,sent,sentons,sentez,sentent
servir,sers,sers,sert,servons,servez,servent
sortir,sors,sors,sort,sortons,sortez,sortent
sourire,souris,souris,sourit,sourions,souriez,sourient
tomber,tombe,tombes,tombe,tombons,tombez,tombent
toucher,touche,touches,touche,touchons,touchez,touchent
traverser,traverse,traverses,traverse,traversons,traversez,traversent
trier,trie,tries,trie,trauns,triez,trient
trouver,trouve,trouves,trouve,trouvons,trouvez,trouvent
vendre,vends,vends,vend,vendons,vendez,vendent
venir,viens,viens,vient,venons,venez,viennent
vivre,vis,vis,vit,vivons,vivez,vivent
voir,vois,vois,voit,voyons,voyez,voient
vouloir,veux,veux,veut,voulons,voulez,veulent
s’amuser,m’amuse,t’amuses,s’amuse,nous amusons,vous amusez,s’amusent
s’appeler,m’appelle,t’appelles,s’appelle,nous appelons,vous appelez,s’appellent
s’énerver,m’énerve,t’énerves,s’énerve,nous énervons,vous énervez,s’énervent
s’habiller,m’habille,t’habilles,s’habille,nous habillons,vous habillez,s’habillent
se coucher,me couche,te couches,se couche,nous couchons,vous couchez,se couchent
se dépêcher,me dépêche,te dépêches,se dépêche,nous dépêchons,vous dépêchez,se dépêchent
se doucher,me douche,te douches,se douche,nous douchons,vous douchez,se douchent
se laver,me lave,te laves,se lave,nous lavons,vous lavez,se lavent
se lever,me lève,te lèves,se lève,nous levons,vous levez,se lèvent
se préparer,me prépare,te prépares,se prépare,nous préparons,vous préparez,se préparent
se présenter,me présente,te présentes,se présente,nous présentons,vous présentez,se présentent
se réveiller,me réveille,te réveilles,se réveille,nous réveillons,vous réveillez,se réveillent'. 'Action' -> 'Present tense conjugation'. 'Text' -> nil } asDictionary}
]
