String.prototype.capitalize = ->
  "#{@charAt(0).toUpperCase()}#{@slice(1)}"

String.prototype.downcase = ->
  "#{@toLowerCase()}"

window.DSYV = {
  candidateNameMap: {
    "obama": "President Obama",
    "romney": "Governor Romney",
    "didnt_vote": "Didn't Vote",
    "independent": "Independent"
  }
}
