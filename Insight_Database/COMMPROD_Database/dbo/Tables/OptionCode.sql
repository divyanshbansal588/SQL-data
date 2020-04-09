CREATE TABLE [dbo].[OptionCode](
	[optionID] [varchar](20) NOT NULL,
	[optionCode] [varchar](100) NOT NULL,
	[default] [char](1) NOT NULL,
	[description] [varchar](1000) NOT NULL,
 CONSTRAINT [pkOptionCode] PRIMARY KEY CLUSTERED 
(
	[optionID] ASC,
	[optionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OptionCode]  WITH NOCHECK ADD  CONSTRAINT [fkOptionCode#OptionDefinition] FOREIGN KEY([optionID])
REFERENCES [dbo].[OptionDefinition] ([optionID])
NOT FOR REPLICATION
GO

ALTER TABLE [dbo].[OptionCode] CHECK CONSTRAINT [fkOptionCode#OptionDefinition]