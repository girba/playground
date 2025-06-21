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
FrenchVerbsAssistant >> gtConjugationOnlyAtFirstPersonSingular [
 	<gtLlmAssistantAction>
 	^ GtLlmAssistantAction new
	    name: 'Conjugation first person singular';
	    priority: 10;
	    addArgument: 'Tense';
		description: 'Please produce the first person singular conjugation in French for the verbs (those from the `Verbs` property) at the tense specified in the argument. The list should be comma separated, where each row has two values: the verb at infinitiv, and the conjugation at first person singular including the pronoun. A row should not contain any other information outside of the verb at the infinitive and the conjugation. Return the result in the `Verbs` property.'
]

{ #category : #'as yet unclassified' }
FrenchVerbsAssistant >> gtConjugationWithAllForms [
 	<gtLlmAssistantAction>
 	^ GtLlmAssistantAction new
	    name: 'Conjugation with all forms';
	    priority: 10;
		addArgument: 'Tense';
		description: 'Please produce all conjugation forms in French for the verbs (those from the `Verbs` property) at the tense specified in the argument. For each verb list the conjugation and format the result in a plain text list comma separated list that also includes the initial verb on the first position. The row should not contain any other information outside of the verb at the infinitive and the conjugations. Do not include the pronoun. Return the result in the `Verbs` property.'
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
FrenchVerbsAssistant >> valueHolderFor: aList [ 
	^ GtLlmSerializableValueHolder new
		name: 'Verbs';
		content: aList;
		serializer: [:list | String lf join: list ]
]
