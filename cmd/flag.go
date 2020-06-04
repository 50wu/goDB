package cmd

type FlagName int

//go:generate stringer -type FlagName -linecomment -output flag_string.go
const (
	FlagNameReleaseVersion FlagName = iota // release-version
	FlagNameEventName                // event-name
	FlagNameEventState                  // event-state
)
