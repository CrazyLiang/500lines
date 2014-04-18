/**
	* postMessage
	* 	A model of the HTML5 PostMessage mechanism
	* 		intended for cross-domain communication between scripts
	*/
module postMessage

open http
open browser
open sop

// Browser API function for cross-document messaging
// used to send a message from one script to another
sig PostMessage extends browser/DomAPICall {
	message : Resource,
	srcOrigin, targetOrigin : URL
}{
	from + to in browser/Script
	args = message
}

pred postMessageRule {
  -- the receiving frame of a PostMessage must belong to the same origin as targetOrigin
  all m : PostMessage | sop/sameOrigin[m.targetOrigin, m.to.context]
}

run {} for 3

