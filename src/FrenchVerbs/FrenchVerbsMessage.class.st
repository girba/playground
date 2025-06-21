Class {
	#name : #FrenchVerbsMessage,
	#superclass : #GtOpenAIActionMessage,
	#category : #FrenchVerbs
}

{ #category : #accessing }
FrenchVerbsMessage >> asAnkiFormattedString [
	| conjugations |
	conjugations := self contentJson at: 'Verbs'.
	^ String
		streamContents: [ :s | 
			s
				nextPutAll: '#separator:tab';
				lf;
				nextPutAll: '#html:false';
				lf.
			conjugations lines
				do: [ :each | 
					s
						nextPutAll: (each copyUpToSubstring: ',');
						nextPutAll: ' (' , self arguments first , ') = [...]';
						tab;
						nextPutAll: (each copyUpToSubstring: ',');
						nextPutAll: ' = ';
						nextPutAll: (each copyFrom: (each copyUpToSubstring: ',') size + 2 to: each size);
						lf ] ]
]

{ #category : #views }
FrenchVerbsMessage >> gtAnkiFormatFor: aView [
	<gtView>
	<gtLlmMessageView>
	self isAssistantRole ifFalse: [ ^ aView empty ].
	^ aView textEditor
		title: 'Anki format';
		aptitude: BrGlamorousCodeEditorAptitude;
		text: [ self asAnkiFormattedString ];
		actionButtonLabel: 'Export'
			tooltip: 'Export as a text file'
			action: [ :aButton |
				| file |
				file := FileLocator temp / 'anki-export.txt'.
				file writeStreamDo: [ :str | str nextPutAll: self asAnkiFormattedString ].
				aButton phlow spawnObject: file
			]

]

{ #category : #views }
FrenchVerbsMessage >> gtListFor: aView [
	<gtView>
	^ aView textEditor
		title: 'List';
		text: [ self contentJson at: 'List' ]
]

{ #category : #views }
FrenchVerbsMessage >> gtListTrimmedFor: aView [
	<gtLlmMessageView>
	^ aView list
		title: 'Verbs';
		items: [ | list lines |
			list := self contentJson at: 'Verbs'.
			lines := list lines size > 7ifTrue: [ (list lines first: 7), {'...'} ]  ]
]
