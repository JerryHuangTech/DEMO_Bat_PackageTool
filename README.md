# 版本控制與部署工具組

這是一套用於並未導入CI/CD使用環境，進行最基本版本控制和應用部署的批處理腳本工具組。它根據`List.txt`清單自動打包應用程序，並支援用戶將打包好的程式部署到客戶公司的伺服器主機上更新。此外，工具組還包括應用程序的備份和退版處理。

## 工具組組件

- **自動打包工具 (`AutoPackagingTool.bat`)**：自動根據`List.txt`清單打包應用程序。
- **部署與備份工具 (`DeploymentWithBackupTool.bat`)**：在更新到新版本的同時進行當前版本的備份。
- **自動退版工具 (`AutoRollbackTool.bat`)**：如果新部署的版本遇到問題，將自動退回到先前的版本。

## 工作流程

1. 使用`自動打包工具`建立部署包。
2. 利用`部署與備份工具`將打包好的應用程序部署到目標伺服器，同時進行必要的備份。
3. 若部署後的新版本遇到重大問題，則使用`自動退版工具`進行版本回退，確保系統穩定性。

結合Python撰寫的Playwright腳本，此工具組還支援部署後的自動化關鍵測試。如果測試未通過，工具組將觸發自動退版。此過程通常安排在非高峰時段進行，以確保最小的中斷。

## 設定檔案

1. `Do_AutoPackagingTool.bat` 設定檔請參照 `Update_Set_GetItem.txt`
2. `Do_DeploymentWithBackupTool.bat` 設定檔請參照 `Update_Set_UpdateItem.txt`
3. `Do_AutoRollbackTool.bat` 設定檔請參照 `Update_Set_GoBack.txt`

## 特點與優勢

- **布署簡單**：不須建立伺服器便能快速布署。
- **流程自動化**：從打包到部署再到退版，整個流程自動化操作，節省人力。
- **即時備份**：在更新前進行即時備份，降低更新風險。
- **退版機制**：提供退版機制，當新版本出現問題時能快速回退。
- **測試驗證**：配合自動化測試確認新版本穩定性，確保品質。
- **時間靈活**：可設定在特定時間執行，不影響業務運作。

## 注意事項

- 在生產環境使用前，請先在控制環境中測試工具。
- 根據部署和備份需求，調整批處理腳本。

## 授權

本工具採用 MIT 授權協議，詳情請參閱授權文件。
