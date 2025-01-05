"""Template for device configuration."""
import os
from dotenv import load_dotenv

def get_variables():
    """Load variables from environment or .env file."""
    # Load from .env file if it exists
    env_file = f'.env.{os.getenv("DEVICE", "default")}'
    if os.path.exists(env_file):
        load_dotenv(env_file)
    
    # Get variables with fallbacks
    return {
        'SSH_HOST': os.getenv('SSH_HOST', ''),
        'SSH_USER': os.getenv('SSH_USER', ''),
        'SSH_PASSWORD': os.getenv('SSH_PASSWORD', '')
    } 