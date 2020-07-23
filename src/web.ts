import { WebPlugin } from '@capacitor/core';
import { JwPlayerPlugin } from './definitions';

export class JwPlayerWeb extends WebPlugin implements JwPlayerPlugin {
  constructor() {
    super({
      name: 'JwPlayer',
      platforms: ['web'],
    });
  }

  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}

const JwPlayer = new JwPlayerWeb();

export { JwPlayer };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(JwPlayer);
