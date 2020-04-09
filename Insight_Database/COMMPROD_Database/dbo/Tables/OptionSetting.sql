CREATE TABLE [dbo].[OptionSetting](
	[clientCode] [varchar](15) NOT NULL,
	[processOptionName] [varchar](20) NOT NULL,
	[optionID] [varchar](20) NOT NULL,
	[optionCode] [varchar](100) NOT NULL,
 CONSTRAINT [pkOptionSetting] PRIMARY KEY CLUSTERED 
(
	[clientCode] ASC,
	[processOptionName] ASC,
	[optionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OptionSetting]  WITH NOCHECK ADD  CONSTRAINT [fkOptionSetting#Client] FOREIGN KEY([clientCode])
REFERENCES [dbo].[Client] ([clientCode])
NOT FOR REPLICATION
GO

ALTER TABLE [dbo].[OptionSetting] CHECK CONSTRAINT [fkOptionSetting#Client]
GO
ALTER TABLE [dbo].[OptionSetting]  WITH CHECK ADD  CONSTRAINT [fkOptionSetting#OptionCode] FOREIGN KEY([optionID], [optionCode])
REFERENCES [dbo].[OptionCode] ([optionID], [optionCode])
GO

ALTER TABLE [dbo].[OptionSetting] CHECK CONSTRAINT [fkOptionSetting#OptionCode]