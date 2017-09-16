# Read the Tab-Separated Value file from the Sedona Pokemon Go Gyms spreadsheet at
# https://docs.google.com/spreadsheets/d/1OSBug__AIZslorsGeEs-k9KTpMcO_J4lK78Gf0Lr3Yc/edit#gid=0
# and create most of the HTML page to be put at http://60bits.net/gyms
#
# awk -f tsv2gyms.awk gyms.tsv >gymsbody.html
#
# Mark Riordan  Sep 2017

BEGIN {
	FS = "\t"
	
	print "<select id=\"gymselect\" onchange=\"onChange();\">"
	print " <option value=\"all\">All</option>"
}

{
	nGyms++
	name = $1
	aryName[nGyms] = $1
	aryId[nGyms] = $2
	aryArea[nGyms] = $3
	aryLocDesc[nGyms] = $4
	aryAddr[nGyms] = $5
	aryNotes[nGyms] = $6
	aryMapUrl[nGyms] = $7
	print " <option value=\"" aryId[nGyms] "\">" name "</option>"
}

END {
	print "</select>"
	print "<table width=\"100%\" cellspacing=\"0\" cellpadding=\"8\" border=\"1\">"

	for(igym = 1; igym <= nGyms; igym++) {
		name = aryName[igym]
		id = aryId[igym]
		area = aryArea[igym]
		locdesc = aryLocDesc[igym]
		addr = aryAddr[igym]
		notes = aryNotes[igym]
		mapurl = aryMapUrl[igym]
	
		print "<tr id=\"" id "\">"
		print "  <td><b>" name "</b><br/>" 
		print "  <table width=\"100%\" border=\"0\">"
		print "    <tr> <td width=\"6%\"> </td>"
		print "      <td>"
		if(length(locdesc) > 0) {
			 print locdesc "<br/>"
		}
		print "        <a href=\"" mapurl "\">Map</a>"
		print " &nbsp; " addr  
		if(length(notes) > 0) {
			 print "<br/>" notes
		}
		print "      </td>"
		print "    </tr>"
		print "  </table>"
		print "  </td>"
		print "</tr>"
	}

    print "</table>"
	print "<p><cite>Mark Riordan &nbsp; Last updated 2017-09-16</cite></p>"
	print "</body>"
	print "</html>"
}