const { app, BrowserWindow, shell } = require('electron');
const path = require('node:path');

function createWindow() {
  const win = new BrowserWindow({
    width: 1280,
    height: 900,
    minWidth: 640,
    minHeight: 576,
    title: 'Olio Cristallo',
    backgroundColor: '#0d1410',
    autoHideMenuBar: true,
    show: false,
    webPreferences: {
      // Il gioco è autosufficiente e non richiede Node.js nel renderer.
      contextIsolation: true,
      nodeIntegration: false,
      sandbox: true
    }
  });

  win.removeMenu();
  win.loadFile(path.join(__dirname, 'index.html'));
  win.once('ready-to-show', () => {
    win.maximize();
    win.show();
  });

  // Evita di aprire finestre esterne involontarie: eventuali link http(s)
  // vengono aperti nel browser predefinito.
  win.webContents.setWindowOpenHandler(({ url }) => {
    if (/^https?:\/\//i.test(url)) shell.openExternal(url);
    return { action: 'deny' };
  });
}

app.whenReady().then(() => {
  app.setAppUserModelId('it.oliocristallo.desktop');
  createWindow();
  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) createWindow();
  });
});

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit();
});
