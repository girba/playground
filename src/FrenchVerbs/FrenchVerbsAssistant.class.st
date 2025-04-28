Class {
	#name : #FrenchVerbsAssistant,
	#superclass : #GtLlmAssistant,
	#category : #FrenchVerbs
}

{ #category : #'as yet unclassified' }
FrenchVerbsAssistant >> createChatOn: aList [
	| chat |
	chat := self createChat.
	chat onInstance: (self valueHolderFor: aList).
	^ chat
]

{ #category : #'as yet unclassified' }
FrenchVerbsAssistant >> defaultDescription [
	^ 'You are an assistant that is used to interactively work on French verbs.'
]

{ #category : #'as yet unclassified' }
FrenchVerbsAssistant >> defaultProviderStencil [
	^ [:aValue | (super defaultProviderStencil value: aValue) assistantMessageClass: FrenchVerbsMessage; userMessageClass: FrenchVerbsMessage ]
]

{ #category : #'as yet unclassified' }
FrenchVerbsAssistant >> gtListFormatDescription [
	<gtLlmAssistantFormat>
	^ GtLlmAssistantFormatDescription new
	type: 'string';
	format: 'Text';
	name: 'Verbs';
	priority: 10;
	example: nil
]

{ #category : #'as yet unclassified' }
FrenchVerbsAssistant >> gtPresentTenseConjugation [
 	<gtLlmAssistantAction>
 	^ GtLlmAssistantAction new
	    name: 'Conjugation';
	    priority: 10;
	    format: 'Conjugation at {1}';
		description: 'Please produce the conjugation at {1} tense in French for the verbs. For each verb list the conjugation and format the result in a plain text list comma separated list that also includes the initial verb on the first position. The row should not contain any other information outside of the verb at the infinitive and the conjugations. Do not include the pronoun. Return the result in the `List` property.'
]

{ #category : #'as yet unclassified' }
FrenchVerbsAssistant >> valueHolderFor: aList [ 
	^ GtLlmSerializableValueHolder new
		name: 'Verbs';
		content: aList;
		serializer: [:list | String lf join: list ]
]
