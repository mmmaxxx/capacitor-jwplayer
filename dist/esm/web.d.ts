import { WebPlugin } from '@capacitor/core';
import { JwPlayerPlugin } from './definitions';
export declare class JwPlayerWeb extends WebPlugin implements JwPlayerPlugin {
    constructor();
    echo(options: {
        value: string;
    }): Promise<{
        value: string;
    }>;
}
declare const JwPlayer: JwPlayerWeb;
export { JwPlayer };
