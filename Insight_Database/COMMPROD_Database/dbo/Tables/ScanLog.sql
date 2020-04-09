CREATE TABLE [dbo].[ScanLog](
	[programName] [varchar](100) NOT NULL,
	[machineName] [varchar](50) NOT NULL,
	[intervalMinutes] [int] NULL,
	[lastScan] [datetime] NOT NULL,
	[statusLog] [varchar](5000) NULL,
 CONSTRAINT [pkScanLog] PRIMARY KEY CLUSTERED 
(
	[programName] ASC,
	[machineName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ScanLog] ADD  CONSTRAINT [DF__scanLog__interva__62108194]  DEFAULT ((0)) FOR [intervalMinutes]
GO
ALTER TABLE [dbo].[ScanLog] ADD  CONSTRAINT [DF__scanLog__lastSca__6304A5CD]  DEFAULT (getdate()) FOR [lastScan]