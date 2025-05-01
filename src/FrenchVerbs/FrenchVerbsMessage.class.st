Class {
	#name : #FrenchVerbsMessage,
	#superclass : #GtOpenAIActionMessage,
	#category : #FrenchVerbs
}

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
