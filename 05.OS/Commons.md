# Common Knowledge
## Settings
### bash_profile VS bashrc
#### .bash_profile
##### Launch timing
- only login

##### main role
- environmental value settings
	* exported values
	* ex.)`PATH=$PATH:hogehoge`
- reading `bashrc`


#### .bashrc
##### Launch timing
- bash launch on intaractive mode

##### main role
- user value settings
	* unexported values
	* ex.)`PS1="hogehgoe"`
- defining Aliases
	* ex.)`alias hoge="foo bar"`
- defining shell Functions
	* ex.)`function hgoe() { ~ }`
- and other settings
