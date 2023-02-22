#!/bin/sh

Context 'git-crypt action'
	Describe 'unlocking with a file'
		Path file="spec/file.txt"

		It 'should successfully unlock encrypted files'
			result() { %text
				#|beep bop
				#|this is a very secret file
				#|do not tell anybody about it
			}

			The path file should be exist
			The contents of path file should equal "$(result)"
		End
	End
End
