CREATE TABLE [dbo].[RegFilename](
	[tsUpdated] [datetime] NOT NULL,
	[clientCode] [varchar](15) NOT NULL,
	[optionName] [varchar](15) NOT NULL,
	[fileName] [varchar](255) NOT NULL,
 CONSTRAINT [pkRegFilename] PRIMARY KEY CLUSTERED 
(
	[clientCode] ASC,
	[fileName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RegFilename]  WITH CHECK ADD  CONSTRAINT [fkRegFilename#ProcessOption] FOREIGN KEY([clientCode], [optionName])
REFERENCES [dbo].[ProcessOption] ([clientCode], [optionName])
GO

ALTER TABLE [dbo].[RegFilename] CHECK CONSTRAINT [fkRegFilename#ProcessOption]