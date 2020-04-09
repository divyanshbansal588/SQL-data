CREATE TABLE [dbo].[AuthorizedClientFunction](
	[functionCode] [varchar](15) NOT NULL,
	[uid] [varchar](50) NOT NULL,
 CONSTRAINT [pkAuthClientFunction] PRIMARY KEY CLUSTERED 
(
	[uid] ASC,
	[functionCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuthorizedClientFunction]  WITH CHECK ADD  CONSTRAINT [fkAuthClientFunc#Function] FOREIGN KEY([functionCode])
REFERENCES [dbo].[ClientFunction] ([code])
GO

ALTER TABLE [dbo].[AuthorizedClientFunction] CHECK CONSTRAINT [fkAuthClientFunc#Function]