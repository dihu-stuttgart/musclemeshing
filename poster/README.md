#	Simtech Corporate Design 2017 Poster

Last update 06.09.2017 by Reiner Dietz 
mailto: reiner.dietz@simtech.uni-stuttgart.de

based on template of IAANS
found on https://gitbucket.simtech.uni-stuttgart.de/maltenbe/latex-cd-poster

Last update 17.11.2016 by Mirco Altenbernd.

For questions or Bug-Reports
mailto: `mirco.altenbernd@ians.uni-stuttgart.de`

compiled and tested with pdflatex 3.14159265-2.6-1.40.15

## Usage

This is a beamer-based poster template which fits into the corporate design concept. To use it
within your beamer file just insert
	`\usetheme[a0,simtech,german,compactbib]{CDP}`
whereby the options in squared brackets are optional, besides the poster format which is necessary
and self explanatory. Other options
* `simtech`: 		enables the SimTech-Logo on the bottom right in the default footer
* `german`: 		switching to style, this means: use the german uni logo
* `compactbib`: switching to a more compact bibliography style

## Header

There are multiple commands to define the header content (some of them are optional).

Caution: Not setting a command means that it is not used overall (empty commands are used!)

* `\setTitle{}` 					(necessary)
	Sets the bold font headline in the mid-blue circle
*	`\setSubTitle{}`				(optional)
	Sets the subtitle in normal font below the title
*	`\setLogoText{}`				(optional)
	Sets a specific institute logo below the logo of the university.
	In the english poster this means that 'Germany' is replaced.
*	`\setInst{}` 						(optional)
	Sets the information of the institute between logo and poster content.
	Can also be used for other things.
*	`\setName{}`						(optional)
	Sets the authors name inside the small black circle.

## Content

The poster content is wrapped inside of

	\begin{document}
		\begin{frame}
			\centering
			\begin{columns}[T]
				\begin{column}{\colCWidth}

					% left content

				\end{column}
				\begin{column}{\colCWidth}

					% right content

				\end{column}
			\end{columns}
		\end{frame}
	\end{document}

The default content font size is `\large` and captions are `\normalsize`. To Structure the content
you can use
	`\section{}`
and
	`\subsection{}`
as in common latex documents.

## Footer

Per default there is a footer with the file `logo_institute.pdf` at the bottom right. If the option
`simtech` is on `logo_simtech.pdf` is on the bottom right and `logo_institute.pdf` is at the bottom
left. The Option
	`\setFooter{}`
enables an individual footer. Below is an example of an individual footer version:

	\setFooter{
	\begin{tikzpicture}[remember picture,overlay]
	    %left aligned footer-content (image)
	    \node[anchor=south west, align=left, yshift=0.01\paperwidth, xshift=0.066\paperwidth] at (current page.south west) {
	      \includegraphics[height=0.035\paperheight]{logo_institute.pdf}
	    };
	    %center aligned footer-content (image)
	    \node[anchor=south, align=center, yshift=0.01\paperwidth, xshift=0] at (current page.south) {
	      % \includegraphics[height=0.035\paperheight]{logo_simtech.pdf}
	    };
	    %center aligned footer-content (text) - yshift may be modified for alignment
	    \node[anchor=south, align=center, yshift=0.025\paperwidth, xshift=0] at (current page.south) {
	      % {\bfseries\large www.sfbtrr75.de}\\
	      % {\bfseries\large www.simtech.uni-stuttgart.de}
	    };
	    %right aligned footer-content (image)
	    \node[anchor=south east, align=right, yshift=0.01\paperwidth, xshift=-0.066\paperwidth] at (current page.south east) {
	      \includegraphics[height=0.035\paperheight]{logo_simtech.pdf}
	    };
	\end{tikzpicture}
	}
