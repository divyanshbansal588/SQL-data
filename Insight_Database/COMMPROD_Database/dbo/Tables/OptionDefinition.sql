CREATE TABLE [dbo].[OptionDefinition](
	[optionID] [varchar](20) NOT NULL,
	[level] [char](1) NOT NULL,
	[name] [varchar](100) NOT NULL,
	[description] [varchar](1000) NOT NULL,
 CONSTRAINT [pkOptionDefinition] PRIMARY KEY CLUSTERED 
(
	[optionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]