function gatherClasses() {
    $page = Invoke-WebRequest -TimeoutSec 2 http://10.0.17.24/Courses.html

    # Get all the tr elements of HTML document
    $trs = $page.ParsedHtml.body.getElementsByTagName("tr")

    # Empty array to hold results
    $fullTable = @()
    for($i=1; $i -lt $trs.length; $i++) { # Going over every tr element
        # Get every td element of current tr element
        $tds = $trs[$i].getElementsByTagName("td")

        # Want to separate start time and end time from one time field
        $times = $tds[5].innerText.Split("-")

        $fullTable += [PSCustomObject]@{
            "Class Code" = $tds[0].innerText
            "Title"      = $tds[1].innerText
            "Days"       = $tds[4].innerText
            "Time Start" = $times[0]
            "Time End"   = $times[1]
            "Instructor" = $tds[6].innerText
            "Location"   = $tds[9].innerText
        }
    } # end of for loop
    return $fullTable
}


function daysTranslator($FullTable) {

#go over every record in the table

for($i=0; $i -lt $FullTable.length; $i++){
    # Empty array to hold days for every record 
    $days = @()

    #if you see "M" -> Monday
    if($FullTable[$i].Days -ilike "*M*"){ $Days += "Monday" }

    # If you see "T" followed by T,W, or F -> Tuesday
    if($FullTable[$i].Days -ilike "*T[W,F]*"){ $Days += "Tuesday" }

    #If you see "W" -> Tuesday 
    if($FullTable[$i].Days -ilike "*W*"){ $Days += "Wednesday" }

    #If you see "TH" -> Thursday 
    if($FullTable[$i].Days -ilike "*TH*"){ $Days += "Thursday" } 

    # F -> Friday 
    if($FullTable[$i].Days -ilike "*F*"){ $Days += "Friday" }

    #Make the switch 

    $FullTable[$i].Days = $Days
}

return $FullTable
}

$FullTable |
