declare module '@capacitor/core' {
    interface PluginRegistry {
        JwPlayer: JwPlayerPlugin;
    }
}
export interface JwPlayerPlugin {
    echo(options: {
        value: string;
    }): Promise<{
        value: string;
    }>;
}
