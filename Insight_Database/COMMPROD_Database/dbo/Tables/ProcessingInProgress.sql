CREATE TABLE [dbo].[ProcessingInProgress](
	[ticketNumber] [varchar](8) NOT NULL,
	[processor] [char](60) NOT NULL,
 CONSTRAINT [pkProcessingInProgress] PRIMARY KEY CLUSTERED 
(
	[ticketNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]