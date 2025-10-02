$scraped_page = Invoke-WebRequest -TimeoutSec 10 http://10.0.17.46/ToBeScraped.html

# Get count of links in the page
#$scraped_page.links.count

# Display links as html element 
#$scraped_page.links

# Display only URL and its text
#$scraped_page.Links | select outertext , href

# Get outer text of every element with tag h2
#$h2s = $scraped_page.ParsedHtml.body.getElementsByTagName("h2") | select outertext
#$h2s

# Print inner text of every div element that has the class as "div-1"
$divs1 = $scraped_page.ParsedHtml.body.getElementsByClassName("div-1") | where { `
    $_.getAttributeNode("class").Value -ilike "div-1" } | select innertext
$divs1