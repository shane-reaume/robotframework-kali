# 🤖 Robot Framework Kali Linux Testing

![Robot Framework](https://robotframework.org/img/RF.svg)

> Automated system health testing for embedded Linux devices using Robot Framework

## 🚀 Quick Start

1. **Clone and Setup**
   ```bash
   git clone https://github.com/shane-reaume/robotframework-kali.git
   cd robotframework-kali
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   pip install -r requirements.txt
   ```

2. **Configure Device**
   ```bash
   cp .env.template .env
   # Edit .env with your device credentials
   ```

3. **Run Tests**
   ```bash
   robot -A configs/kalipi.yaml tests/system_health.robot
   ```

## 📊 What It Tests

- 💾 Memory Usage
- 💽 Disk Space
- ⏱️ System Uptime
- 🔄 CPU Information
- 🌐 Network Interfaces
- 📝 Running Processes
- 🌡️ System Temperature

## 🔧 Testing Multiple Devices

1. Create device config:
   ```bash
   cp configs/devices/template.py configs/devices/your_device.py
   cp configs/kalipi.yaml configs/your_device.yaml
   cp .env.template .env.your_device
   ```

2. Edit configurations with device-specific settings

3. Run tests:
   ```bash
   robot -A configs/your_device.yaml tests/system_health.robot
   ```

## 📝 Test Results

Results are generated in HTML format:
- `log.html` - Detailed test logs with system information
- `report.html` - Test execution summary
- `output.xml` - Machine-readable results

Example test execution:
```bash
==============================================================================
System Health                                                                 
==============================================================================
Check System Memory                                                   | PASS |
Check Disk Usage                                                     | PASS |
Check System Uptime                                                  | PASS |
Check CPU Information                                                | PASS |
Check Network Interfaces                                             | PASS |
Check Running Processes                                              | PASS |
Check System Temperature                                             | PASS |
==============================================================================
```

## 🔒️ Setting Up Kali Linux on Raspberry Pi

1. **Download and Install Raspberry Pi Imager**
   - Get the latest version from [Raspberry Pi's official website](https://www.raspberrypi.com/software/)
   - Version 1.8.5 or later recommended

2. **Create Kali Linux SD Card**
   - Launch Raspberry Pi Imager
   - Click "Choose OS"
   - Select "Other specific purpose OS"
   - Find and select "Kali Linux"
   - Choose your SD card under "Storage"
   - Click "Write" to create the bootable SD card

3. **First Boot Setup**
   - Insert SD card into Raspberry Pi
   - Connect keyboard, mouse, and monitor
   - Power on the device
   - Default credentials:
     - Username: `kali`
     - Password: `kali`
   - Change default password immediately

4. **Network Configuration**
   - Connect to your network via Ethernet or WiFi
   - Note down the IP address (`ip addr show`)
   - Enable SSH if not enabled:
     ```bash
     sudo systemctl enable ssh
     sudo systemctl start ssh
     ```

5. **Update System**
   ```bash
   sudo apt update
   sudo apt upgrade -y
   ```

Now your Kali Linux Raspberry Pi is ready for testing with this framework.

## 🔒 Security Notes

- Never commit `.env` files or any credentials
- Use environment variables for sensitive data
- Keep credentials secure and rotate regularly

## 📁 Project Structure

```
robotframework-kali/
├── configs/              # Device configurations
├── tests/               # Test suites
│   └── resources/       # Shared resources
├── .env.template        # Environment template
└── requirements.txt     # Dependencies
```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.
