# Foreign Language Learning Accelerator
Language acquisition is hard. This set of ruby scripts aims to make it a little bit easier. 

## The Idea
Language learning can get boring, so its important to learn from things that interest us.
This set of scripts can read a PDF file from any latin script language, and output a list of words along with their usage frequency. Non-latin script languages are currently unsupported. 

You can combine this with a little bit of Google Sheets wizardy and get yourself a list of the most frequently occuring words in the document along with their translation.

## How to Use It

1. Clone the repository and change your directory to the newly cloned repo.

```bash
git clone https://github.com/realstorypro/language-accelerator.git
```

2. Run bundler to download dependencies.
```bash
bundle
```

3. Copy the PDF you'd like to use and rename it to input.pdf
4. Convert the PDF into text file.
```bash
ruby conver.rb

## input.txt file will be created.
```

5. If the PDF you've inputted has a cover or a table of contents it will be included in the input.txt.
You can open the file and manually remove the lines you wish to be excluded from the frequency count.
   
6. Create a word frequency CSV import for Google Spreadsheets.
```bash
ruby frequency.rb
## export.txt file will be created.
```

## Google Spreadsheets
1. Import the file to Google Spreadsheets by heading over to __File__ menu and choosing __Import__.
2. You will be presented with an import dialog box. Keep the defaults.

<img src="/docs/import-dialog.png" alt="Google Sheets Import Dialog" width="50%" />

3. Add a header row above the newly inserted data.
<img src="/docs/header-translation.png" alt="Google Spreadsheet Header" width="70%" />
   
4. Add the following formula under the cell C2
```bash
=PROPER(GOOGLETRANSLATE(A2,"auto","en"))
```
5. Click on the blue dot, to copy the formula all the way down to the end.
<img src="/docs/expand-formula.png" alt="Expand Formula Dialog" width="70%" />

6. Add the following formula to D2, and expand it all the way down by clicking the blue dot in the corner of the cell.
```
=A2<>C2
```

7. Next, go to __Data__ menu and pick __Create a Filter__. 

8. Now click on the green icon next to _Successful Translation_. Uncheck "False", and click OK.
<img src="/docs/successful-translation.png" alt="Translation filter on Google Sheets" width="50%" />
   
9. Now click on the green icon next to the _# of Occurrences_. Pick __Sort Z > A__ and uncheck all occurrences under 10 (or whatever you would like the minimum number of occurrences to be).
<img src="/docs/occurances.png" alt="Occurance filter and sort order on google sheets" width="50%" />

#### You're DONE 🥳. 
You now have a list of words that you have been using at least 10 times, along with their translation; ordered by the frequency of use.


#### LICENSE
This project is licensed under the terms of the MIT license.
