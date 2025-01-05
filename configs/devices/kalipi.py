"""Variable file for Kali Pi configuration."""
import os
from dotenv import load_dotenv

def get_variables():
    """Load variables from environment or .env file."""
    # Load from .env file if it exists
    if os.path.exists('.env'):
        load_dotenv()
    
    # Get variables with fallbacks
    return {
        'KALI_SSH_HOST': os.getenv('KALI_SSH_HOST', ''),
        'KALI_SSH_USER': os.getenv('KALI_SSH_USER', ''),
        'KALI_SSH_PASSWORD': os.getenv('KALI_SSH_PASSWORD', '')
    } 