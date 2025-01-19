% این فایل کلاس پایان‌نامه دانشگاه شهید بهشتی است
% -------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{style/SBU-Thesis}

% تعریف گزینه‌های ورودی
% -------------------------
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions

% بارگذاری کلاس پایه با تنظیمات پیش‌فرض
% -------------------------
\LoadClass[a4paper,12pt]{book}

% تعریف دستورات برای اطلاعات پایان‌نامه
% -------------------------
\def\university#1{\gdef\@university{#1}}
\def\department#1{\gdef\@department{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\thesisdate#1{\gdef\@thesisdate{#1}}

% تعریف دستورات برای اساتید راهنما و مشاور
% -------------------------
\newcommand{\firstsupervisor}[1]{\def\@firstsupervisor{#1}}
\newcommand{\secondsupervisor}[1]{\def\@secondsupervisor{#1}}
\newcommand{\firstadvisor}[1]{\def\@firstadvisor{#1}}
\newcommand{\secondadvisor}[1]{\def\@secondadvisor{#1}}

% تعریف دستورات برای مشخصات نویسنده
% -------------------------
\def\name#1{\gdef\@name{#1}}
\def\surname#1{\gdef\@surname{#1}}
\def\keywords#1{\gdef\@keywords{#1}}
\def\latinkeywords#1{\gdef\@latinkeywords{#1}}
\def\fa-abstract#1{\gdef\@fa-abstract{#1}}
\def\pish#1{\gdef\@pish{#1}}
\def\en-abstract#1{\gdef\@en-abstract{#1}}
\def\faculty#1{\gdef\@faculty{#1}}
\def\subject#1{\gdef\@subject{#1}}

% تعریف دستورات برای مشخصات داوران
% -------------------------
\def\davaranSupervisor#1{\gdef\@davaranSupervisor{#1}}
\def\davaranSecondSupervisor#1{\gdef\@davaranSecondSupervisor{#1}}
\def\davaranAdvisor#1{\gdef\@davaranAdvisor{#1}}
\def\davaranInternal#1{\gdef\@davaranInternal{#1}}
\def\davaranExternal#1{\gdef\@davaranExternal{#1}}
\def\davaranAssignee#1{\gdef\@davaranAssignee{#1}}
\def\davaranDate#1{\gdef\@davaranDate{#1}}

% تعریف اطلاعات بیشتر برای پایان‌نامه
% -------------------------
\def\reportVersion#1{\gdef\@reportVersion{#1}}
\def\field#1{\gdef\@field{#1}}
\def\projectLabel#1{\gdef\@projectLabel{#1}}
\def\studentID#1{\gdef\@studentID{#1}}
\def\latintitle#1{\gdef\@latintitle{#1}}
\def\latinauthor#1{\gdef\@latinauthor{#1}}
\def\latindegree#1{\gdef\@latindegree{#1}}
\def\latinfaculty#1{\gdef\@latinfaculty{#1}}
\def\latinthesisdate#1{\gdef\@latinthesisdate{#1}}
\def\latinsubject#1{\gdef\@latinsubject{#1}}
\def\latinfield#1{\gdef\@latinfield{#1}}
\def\firstlatinsupervisor#1{\gdef\@firstlatinsupervisor{#1}}
\def\secondlatinsupervisor#1{\gdef\@secondlatinsupervisor{#1}}
\def\firstlatinadvisor#1{\gdef\@firstlatinadvisor{#1}}
\def\secondlatinadvisor#1{\gdef\@secondlatinadvisor{#1}}
\def\latinname#1{\gdef\@latinname{#1}}
\def\latinsurname#1{\gdef\@latinsurname{#1}}
\def\latinkeywords#1{\gdef\@latinkeywords{#1}}
\def\latinuniversity#1{\gdef\@latinuniversity{#1}}

% تعریف گزینه‌های پایان‌نامه ارشد و سمینار ارشد
% -------------------------
\newif\if@mscthesis
\@mscthesisfalse
\DeclareOption{msc}{\@mscthesistrue}

\newif\if@mscthesisReport
\@mscthesisReportfalse
\DeclareOption{mscS}{\@mscthesisReporttrue}

\ProcessOptions

% تنظیم پیش‌فرض برای پروژه و درجه علمی
% -------------------------
\ifx\@projectLabel\undefined
{
	\if@mscthesis
	{\projectLabel{پایان‌نامه کارشناسی ارشد}}
	\else
	\if@mscthesisReport
	{\projectLabel{گزارش سمینار کارشناسی ارشد }}
	\else
	{\projectLabel{رساله}}
	\fi\fi
}\fi

\ifx\@degree\undefined
{
	\if@mscthesis
	\degree{کارشناسی ارشد}
	\else
	\if@mscthesisReport
	\degree{کارشناسی ارشد}
	\else
	\degree{دکتری}
	\fi\fi
}

% تعریف صفحه اول پایان‌نامه
% -------------------------
\newcommand{\firstPage}{
	\begin{titlepage}
		%\topmargin=-30pt
		\vspace{-10mm}
		% افزودن لوگوی دانشگاه
		\centerline{{\includegraphics[width=4cm]{style/logo.png}}}
		\vspace{7mm}
		% نمایش نام دانشگاه و دانشکده
		\ifx\@university\undefined%
		\relax
		\else
		\centerline{\large \bf \@university} 
		\fi
		{\large\bfseries\@faculty\space}
		% نمایش اطلاعات پروژه و گرایش
		\if@mscthesis 
		{\large\bfseries{\@projectLabel\ \ \@subject}
			\ifx\@field\undefined%
			\relax
			\else
			\\گرایش \@field
			\fi
		}
		\else
		\if@mscthesisReport 
		{\large\bfseries{\@projectLabel\ \ \@subject}
			\ifx\@field\undefined%
			\relax
			\else
			\\گرایش \@field
			\fi
		}
		\else
		{\large\bfseries \@projectLabel\ \ \writtenfor
			\@degree{} 
		}
		{\large\bfseries{در رشته \@subject}}
		\vskip .2cm
		\centerline{\large \bfseries%
			گرایش \@field}
		\fi\fi	
		\par
		
		\vskip 1cm
		
		
		\linespread{1.2}
		{\huge \titlefont \@title \par}
		
		\vskip 15mm
		
		\vskip 10mm
		{\bfseries\by}%\par
		\\ \vskip 0.45cm
		{\Large\bfseries{\Large\bfseries \@name\ \ \@surname}}
		%\par
		\vskip 10mm
		\large
		{
			\ifx\@firstsupervisor\undefined%
			\ifx\@secondsupervisor\undefined%
			\else
			\fi
			\else
			\ifx\@secondsupervisor\undefined%
			استاد راهنما
			\\ \vskip 0.35cm
			{\large\bfseries
				\@firstsupervisor}
			\else
			\large
			اساتید راهنما:
			\\ \vskip 0.35cm
			{\large\bfseries \@firstsupervisor{} و \@secondsupervisor}
			\fi\fi}
		\par\large
		{\ifx\@firstadvisor\undefined%
			\ifx\@secondadvisor\undefined%
			\else\fi
			\else
			\ifx\@secondadvisor\undefined%
			\vskip 1cm
			استاد مشاور
			\\ \vskip 0.35cm
			{\large\bfseries
				\@firstadvisor}
			\else
			
			\large
			\vskip 1cm
			استادان مشاور
			\\ \vskip 0.4cm
			{\large\bfseries\@firstadvisor{} و \@secondadvisor}
			\fi\fi}
		
		\par
		\vskip 10mm
		{\large \@thesisdate}
	\end{titlepage}%
} 


\def\titlepage{\newpage\centering
	\thispagestyle{empty}
	\parindent 0pt \parskip 10pt plus 1fil minus 1fil
	\def\baselinestretch{1}\@normalsize\vbox to \vsize\bgroup\vbox to 9in\bgroup}
\def\endtitlepage{\par\kern 0pt\egroup\vss\egroup\newpage}

% تعریف صفحه چکیده فارسی
% -------------------------
\newcommand\abstractPage{
	\newpage
	\thispagestyle{plain}
	\vskip 15mm
	{\noindent\bfseries \hfil \large چکیده}
	\vspace{5mm}
	\par
	\noindent
	\@fa-abstract
	\vspace{8mm}
	
	\ifdefined\@keywords
	{
	\textbf{واژگان کلیدی:} 
	\@keywords
	}
	\fi
	\newpage
}


%صفحه تایید داوران
% -------------------------

\newcommand{\davaranPage}
{
	\newpage
	\begin{center}
		\thispagestyle{plain}
		\vspace{-10mm}
		\centerline{{\includegraphics[width=4cm]{style/logo.png}}}
		\vspace{7mm}
		\ifx\@university\undefined%
		\relax
		\else
		\centerline{\large \bf \@university} 
		\fi
		{\large\bfseries\@faculty\space}
		\vskip 1cm
		\linespread{1.5}
		
		\vskip 5mm
		\large{\@projectLabel\ \ \@subject}
		\ifx\@field\undefined%
		\relax
		\else
		- گرایش \@field
		\fi
		\\تحت عنوان:
		\par \@title
	\end{center}%
	\vskip 1cm
	\begin{small}
		\noindent
		در تاریخ 
		 \ifdefined\@davaranDate
		 \@davaranDate \space
		 \else
		\space \space \space\space\space \space \space\space
		\space \space \space\space\space \space \space\space
		\space \space \space\space\space \space \space\space
		\fi
		پایان‌نامه دانشجو، 
		\@name \ \@surname
		، توسط کمیته تخصصی داوران مورد بررسی و تصویب نهایی قرار گرفت.
		\\
		\par
		\vfill
		\newcounter{dc}
		\setcounter{dc}{1}
		\newcommand{\amp}{&}
		\begin{tabular}{ p{4.5cm} p{7cm} p{3.5cm}}
   		 \ifdefined\@davaranSupervisor
		 		\arabic{dc}- استاد راهنما اول: \amp \@davaranSupervisor \amp امضا \\ \addtocounter{dc}{1}
		 \fi
		 \ifdefined\@davaranSecondSupervisor
			 \arabic{dc}- استاد راهنما دوم: \amp \@davaranSecondSupervisor \amp امضا \\ \addtocounter{dc}{1}
		 \fi
		 \ifdefined\@davaranAdvisor
		    	\arabic{dc}- استاد مشاور: \amp \@davaranAdvisor \amp امضا \\ \addtocounter{dc}{1}
		 \fi
		 \ifdefined\@davaranInternal
		     \arabic{dc}- استاد داور (داخلی): \amp \@davaranInternal \amp امضا \\ \addtocounter{dc}{1}
		 \fi
	 	 \ifdefined\@davaranExternal
		       \arabic{dc}- استاد داور (خارجی): \amp \@davaranExternal \amp امضا \\ \addtocounter{dc}{1}
		 \fi
		 \ifdefined\@davaranAssignee
		 		\arabic{dc}- نماینده تحصیلات تکمیلی: \amp \@davaranAssignee \amp امضا \\ \addtocounter{dc}{1}
		 \fi
		 \vspace{1.8cm}
		\end{tabular}
	\end{small}
	
}

% صفحه واگذاری حقوق
% -------------------------
\newcommand{\rightsPage}
{
	\newpage
	\thispagestyle{plain}
	\begin{center}
		\vspace*{\stretch{1}}
		کلیه حقوق مادی مترتب بر نتایج مطالعات،\\
		ابتکارات و نوآوری‌های ناشی از تحقیق موضوع\\
		این پایان‌نامه متعلق به دانشگاه شهید بهشتی\\
		می‌باشد.
		\vspace*{\stretch{1}}
	\end{center} 
	\pagebreak
	
}


% صفحه کپی رایت
% -------------------------

\newcommand{\copyRightPage}
{
	\newpage
	\thispagestyle{plain}
	\begin{center}
		\textbf{ 
			به نام خدا \\
		}
		
		\vspace{1cm}
	\end{center}
	\noindent
	\textbf{نام و نام خانوادگی:} \@name \ \@surname \ 
	\\
	\textbf{عنوان پایان‌نامه:} \@title
	\\
	\ifx\@secondsupervisor\undefined%
	\textbf{استاد راهنما:}
	{
		\@firstsupervisor
	}
	\else
	\textbf{اساتید راهنما:}
	{\@firstsupervisor{} و \@secondsupervisor}
	\fi
	\\
	\par
	\noindent
	اینجانب 
	\@name \ \@surname \ 
	تهیه‌کننده \@projectLabel 
	\space
	حاضر، خود را ملزم به حفظ امانت‌داری و قدردانی از زحمات سایر محققین و نویسندگان بنابر قانون \lr{Copyright} می‌دانم. بدین وسیله اعلام می‌نمایم که مسئولیت کلیه مطالب درج شده با اینجانب می‌باشد و در صورت استفاده از اشکال، جداول و مطالب سایر منابع، بلافاصله مرجع آن ذکر شده و سایر مطالب از کار تحقیقاتی اینجانب استخراج گشته است و امانت‌داری را به صورت کامل رعایت نموده‌ام. در صورتی که خلاف این مطلب ثابت شود، مسئولیت کلیه عواقب قانونی با شخص اینجانب می‌باشد.
	
	
	\vspace{.5cm}
	\begin{flushleft}
		\begin{tabular}{rr}
			نام و نام خانوادگی:   & 	\@name{} \@surname \\
			تاریخ و امضا: & \\
		\end{tabular}
	\end{flushleft}
}


% تعریف صفحه پیشگفتار
% -------------------------
\newcommand\prefacePage
{
	\newpage
	\thispagestyle{plain}
	\vskip 15mm
	{\noindent\bfseries \hfil \large پیشگفتار}
	\vspace{5mm}
	\par
	\noindent
	\@pish
	\vspace{8mm}
	\par
	\noindent
	\ifdefined\@keywords
	\fi
	\newpage
}

% تعریف صفحه چکیده انگلیسی
% -------------------------
\newcommand{\latinAbstractPage}{
	\newpage\clearpage
	\thispagestyle{empty}
	\vskip 15mm
	{\noindent\bfseries \hfil Abstract:}
	\vspace{5mm}
	\par
	\noindent
	\begin{LTR}
		\lr{
			\@en-abstract
		}
		\vspace{8mm}
		\par
		\ifdefined\@latinkeywords
		{
			\lr{
				\textbf{Keywords:} 
				\@latinkeywords
			}
		}
		\fi
	\end{LTR}
}

% تعریف صفحه عنوان انگلیسی
% -------------------------
\newcommand{\latinFirstPage}{
	\begin{titlepage}
		\linespread{0.8}
		\vspace{-10mm}
		\centerline{{\includegraphics[width=4cm]{style/logo.png}}}
		\vspace{1mm}
		\ifx\@latinuniversity\undefined%
		\relax
		\else
		\centerline{\large \lr{\@latinuniversity}}
		\fi
		\large
		\lr{\@latinfaculty}\space 
		\vskip 0.8cm
		
		\vspace{0.8cm}
		{
			\large
			\lr{
				A THESIS SUBMITTED\\
				FOR THE DEGREE OF\\
			}
			\if@mscthesis
			\lr{MASTER OF SCIENCE}
			\else
			\if@mscthesisReport
			\lr{MASTER OF SCIENCE}
			\else
			\lr{Doctor of Philosophy}
			\fi \fi
			\par
		}
		\vskip 15mm
		
		% عنوان پایان‌نامه انگلیسی
		\linespread{1.1}
		{\huge
		\bf \lr{\@latintitle} \par}
		\vskip 5mm
		{\large By:}
		\par
		\vskip 5mm
		{\large \rm \bf \Large \lr{\@latinname \; \@latinsurname}}
		\par
		
		% نمایش اساتید راهنما
		\large
		{\ifx\@firstlatinsupervisor\undefined%
			\ifx\@secondlatinsupervisor\undefined%
			\else\fi
			\else
			\ifx\@secondlatinsupervisor\undefined%
			\Large\lr{Supervisor:}
			\vskip 5mm
			{\large\bfseries\par
				\lr{\@firstlatinsupervisor}}
			\else
			\large
			\Large\lr{Supervisors:}
			\vskip 5mm
			\par
			{\large\bfseries \lr{\@firstlatinsupervisor{} and \@secondlatinsupervisor}}
			\fi\fi}
		\par
		\vspace{1cm}
		
		% نمایش اساتید مشاور
		\large
		{\ifx\@firstlatinadvisor\undefined%
		\ifx\@secondlatinadvisor\undefined%
		\else\fi
		\else
		\ifx\@secondlatinadvisor\undefined%
		\large\lr{Advisor:}
		\vskip 5mm
		{\large\bfseries\par
			\lr{\@firstlatinadvisor}}
		\else
		\large
		\Large\lr{Advisors:}
		\vskip 5mm
		\par
		{\Large\bfseries \lr{\@firstlatinadvisor{} and \@secondlatinadvisor}}
		\fi\fi}
		\vskip 5mm
		\par
		\vspace{1cm}
		\vspace*{\fill}
		\large{\lr{\@latinthesisdate}}
	\end{titlepage}
}


\def\version{نسخه‌ی }
\def\report{گزارش}
\def\onvan{عنوان}
\def\writtenfor{برای دریافت درجه }
\def\by{نگارش:}
\def\latinby{By:}
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
	\hbox{}
	\thispagestyle{empty}
	\newpage
	\if@twocolumn\hbox{}\newpage\fi\fi\fi}



\newcommand{\cchapter}[1]
{
	\chapter[#1]{\centering #1}
	\thispagestyle{empty} % حذف شماره صفحه
	\pagebreak
}

% تنظیمات حاشیه صفحات
% -------------------------
\usepackage[top=35mm, bottom=25mm, left=25mm, right=25mm]{geometry}

% تنظیم فاصله بین عناوین و متن
% -------------------------
\usepackage[bottomtitles]{titlesec}

\titleformat{\section}
{\normalfont\Large\bfseries}{\thesection}{1em}{}
\titleformat{\subsection}
{\normalfont\large\bfseries}{\thesubsection}{1em}{}
\titleformat{\subsubsection}
{\normalfont\normalsize\bfseries}{\thesubsubsection}{1em}{}
\titleformat{\paragraph}[runin]
{\normalfont\normalsize\bfseries}{\theparagraph}{1em}{}
\titleformat{\subparagraph}[runin]
{\normalfont\normalsize\bfseries}{\thesubparagraph}{1em}{}

\titlespacing\section{0pt}{22pt plus 4pt minus 2pt}{0pt plus 2pt minus 2pt}
\titlespacing\subsection{0pt}{18pt plus 4pt minus 2pt}{0pt plus 2pt minus 2pt}
\titlespacing\subsubsection{0pt}{16pt plus 4pt minus 2pt}{0pt plus 2pt minus 2pt}

% تنظیم بسته‌های مرتبط با فرمت‌دهی صفحات و زیرنویس‌ها
% -------------------------
\usepackage{indentfirst} % ایجاد تورفتگی در پاراگراف اول
\usepackage{multirow} % ایجاد جدول‌های چندسطری
% بسته‌های موردنیاز برای ریاضیات در زی‌پرشین
\usepackage{amsthm,amssymb,amsmath}


% تنظیمات خط بالایی صفحات
% -------------------------
\usepackage{fancyhdr}
\pagestyle{fancy}

% طول برای کنترل \fancyheadoffset و محاسبه \headline
% -------------------------
\lhead{} % تنظیم بخش چپ هدر
\newlength\FHoffset
\setlength\FHoffset{0cm} % تنظیم فاصله خط از لبه کناری
\addtolength\headwidth{2\FHoffset}
\fancyheadoffset{\FHoffset}

% این طول ها برش هدرول را به چپ و راست کنترل می کنند
% -------------------------
\newlength\FHleft
\newlength\FHright

% در اینجا برش ها توسط کاربر کنترل می شود
% -------------------------
\setlength\FHleft{1cm}
\setlength\FHright{0cm}


% نمایش شماره صفحه در هدر
% -------------------------
\lhead{\thepage} 
\rhead{\leftmark}

% حذف شماره صفحه از پایین صفحه
% -------------------------
\cfoot{}

\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{ #1}}{}}

% تنظیم خط زیر هدر
% -------------------------
\newbox\FHline
\setbox\FHline=\hbox{\hsize=\paperwidth
\hspace*{\FHleft}
\rule{\dimexpr\headwidth-\FHleft-\FHright\relax}{\headrulewidth}\hspace*{\FHright}
}

% تنظیم فاصله خطوط متن
% -------------------------
\linespread{2}

% تنظیمات بیشتر برای زیرنویس‌ها
% -------------------------
\usepackage[bottom,hang,flushmargin]{footmisc}
\usepackage{zref-perpage}
\zmakeperpage{footnote}
\setlength{\skip\footins}{12pt}


% لینک‌دهی رنگی به اجزای متن
% -------------------------
\usepackage[pagebackref=false,colorlinks,linkcolor=blue,citecolor=blue]{hyperref}

% تنظیمات نمایش فهرست‌ها
% -------------------------
\setcounter{tocdepth}{3}
\usepackage{bookmark}

% -------------------------
\input{style/config.tex}


% تنظیمات فونت‌های فارسی و لاتین
% -------------------------
\usepackage[font=small,labelfont=bf,skip=4pt]{caption}
\usepackage{graphicx}
\usepackage{xepersian}
\setlatintextfont[Scale=1]{TeX Gyre Termes}
\settextfont[ExternalLocation, BoldFont=XB ZarBd, ItalicFont=XB ZarIt, BoldItalicFont=XB ZarBdIt]{XB Zar}
\setdigitfont[ExternalLocation, BoldFont=XB ZarBd, ItalicFont=XB ZarIt, BoldItalicFont=XB ZarBdIt]{XB Zar}
\defpersianfont\titlefont[ExternalLocation, BoldFont=XB ZarBd]{XB ZarBd}


% تنظیم فاصله‌های خطوط برای جلوگیری از نشکستن متن
% -------------------------
\setlength{\emergencystretch}{4pt} % جلوگیری از نشکستن خطوط در موارد خاص

% تعریف مجدد فهرست مطالب برای نمایش شماره صفحه ساده
% -------------------------
\let\oldtoc\tableofcontents
\renewcommand{\tableofcontents}{
	\pagestyle{plain}
	\oldtoc
	\clearpage
	\pagestyle{fancy}
}

% تعریف مجدد فهرست تصاویر برای نمایش شماره صفحه ساده
% -------------------------
\let\oldlistoffigures\listoffigures
\renewcommand{\listoffigures}{
	\pagestyle{plain}
	\oldlistoffigures
	\clearpage
	\pagestyle{fancy}
}

% تعریف مجدد فهرست جداول برای نمایش شماره صفحه ساده
% -------------------------
\let\oldlistoftables\listoftables
\renewcommand{\listoftables}{
	\pagestyle{plain}
	\oldlistoftables
	\clearpage
	\pagestyle{fancy}
}


% تنظیم نام کتاب‌نامه و واژگان کلیدی
% -------------------------
\renewcommand{\bibname}{مراجع}
\renewcommand{\listfigurename}{فهرست نمودارها}
\renewcommand{\listtablename}{فهرست جدول‌ها}

% دستوری برای تعریف واژه‌نامه انگلیسی به فارسی
% -------------------------
\newcommand\persiangloss[2]{#1\dotfill\lr{#2}\\}
% دستوری برای تعریف واژه‌نامه فارسی به انگلیسی 
% -------------------------
\newcommand\englishgloss[2]{#2\dotfill\lr{#1}\\}


% -------------------------
\usepackage{etoolbox}
\newbool{firstbib}
\booltrue{firstbib}
\preto{\bibitem}{
	\ifbool{firstbib}
	{
		\thispagestyle{fancy}
		\setbool{firstbib}{false}
	}{}
}

%جلوگیری از شماره‌گزاری تصاویر در فهرست
% -------------------------
\usepackage{notoccite} 

% تبدیل ارجاعات به جای چند عدد به محدوده مثلا [10-13]
% -------------------------
\usepackage{cite} 

% دستور برای تغییر نام عنوان‌ها
% -------------------------
\let\oldbibliography\bibliography
\renewcommand{\bibliography}[1]{
	\linespread{1.2}
	\addcontentsline{toc}{chapter}{مراجع}
	\oldbibliography{#1}
	\linespread{2}
}



% پایان کد
% -------------------------
